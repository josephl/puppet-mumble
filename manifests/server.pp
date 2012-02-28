

class mumble::server inherits mumble {

  file { $conf_file :
    ensure  => present,
    owner   => 'root',
    group   => 'mumble-server',
    mode    => '0640',
    require => Package['mumble-server'],
    source  => 'puppet:///modules/monleezy-mumble/mumbler-server.ini',
  }

  service { 'mumble-server':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    subscribe  => File[$conf_file],
  }

}

