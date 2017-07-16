class custom_nodejs {

  file { 'nodejs_app.conf':
    path    => '/etc/init/nodejs_app.conf',
    ensure  => file,
    notify  => [ Exec['start_nodejs_app'] ],
    content => template('custom_nodejs/nodejs_app.conf.erb'),
	require => [ User['www-data'], Class['nodejs'] ]
  }
  
  exec { 'start_nodejs_app':
    command => 'start nodejs_app',
    path    => '/sbin/:/bin/',
    require => [ File['nodejs_app.conf'] ]
  }
  
  $npm_packages = hiera('nodejs::npm')
  create_resources(nodejs::npm, $npm_packages)

}
