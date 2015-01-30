class infra::puppetmaster (
  $answers = 'puppet:///modules/infra/puppetmaster.answers',
  $puppetdb_server = 'puppetdb.localdomain'
) {

  # Provide the answerfile for the puppet installer
  file { '/etc/foreman/foreman-installer-answers.yaml':
    ensure  => present,
    source  => $answers,
    owner   => root,
    group   => root,
    mode    => '0600',
    require => Package['foreman-installer'],
    notify  => Exec['foreman-installer'],
  }

  class { 'puppetdb::master::config':
    puppetdb_server   => $puppetdb_server,
    require           => Exec['foreman-installer'],
    strict_validation => false,
    restart_puppet    => false
  }

  include infra::installer

}
