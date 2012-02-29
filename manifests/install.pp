
class mumble::install {
  package { 'mumble-server':
    ensure => installed,
  }
}
