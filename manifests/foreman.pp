class infra::foreman (
  $answers = 'puppet:///modules/infra/foreman.answers'
) {

  # Provide the answerfile for the puppet installer
  file { '/etc/foreman/foreman-installer-answers.yaml':
    ensure  => present,
    source  => $answers,
    owner   => root,
    group   => root,
    mode    => '0600',
    require => Package['foreman-installer'],
  }

  include infra::installer

}