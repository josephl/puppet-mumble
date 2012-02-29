

class mumble::server inherits mumble {

  package { 'mumble-server':
    ensure => installed,  # afaik, Ubuntu names pkg this
  }

  file { $conf_file :
    ensure  => present,
    owner   => 'root',
    group   => 'mumble-server',
    mode    => '0640',
    require => Package['mumble-server'],
    source  => 'puppet:///modules/monleezy-mumble/mumbler-server.ini',
    notify  => Service['mumble-server'],
  }

  service { 'mumble-server':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => Package['mumble-server'],
  }



}

