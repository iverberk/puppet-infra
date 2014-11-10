class infra::foreman {

  # Provide the answerfile for the puppet installer
  file { '/etc/foreman/foreman-installer-answers.yaml':
    ensure  => present,
    source  => 'puppet:///modules/infra/foreman.answers',
    owner   => root,
    group   => root,
    mode    => '0600',
    require => Package['foreman-installer'],
  }

  include infra::installer

}