class infra::installer (
  $installer_version = '1.6.2-1.el6'
) {

  package { 'cronie':
    ensure => present
  } ->

  package { 'foreman-installer':
    ensure => $installer_version,
    notify => Exec['foreman-installer']
  }

  # Execute the foreman installer
  exec { 'foreman-installer':
    command     => '/usr/sbin/foreman-installer',
    timeout     => 0,
    refreshonly => true,
    require     => File['/etc/foreman/foreman-installer-answers.yaml']
  }

}