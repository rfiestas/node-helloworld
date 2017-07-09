file { 'nodejs_app.conf':
  path    => '/etc/init/nodejs_app.conf',
  ensure  => file,
  notify  => [ User['www-data'], Service['nodejs_app'] ]
  content => template('nodejs_app.conf'),
}
service { 'nodejs_app':
  ensure => running,
}