class stanbol::install {
  include stanbol::params

  file { "${stanbol::params::home_dir}":
    ensure => directory
  }

  file { "${stanbol::params::scripts_dir}":
    ensure  => directory,
    require => File["${stanbol::params::home_dir}"]
  }

  exec { "stanbol_install":
    command => "wget ${stanbol::params::source_url} -O stanbol-launcher.jar",
    cwd     => "${stanbol::params::home_dir}",
    creates => "${stanbol::params::home_dir}/stanbol-launcher.jar",
    path    => "/usr/bin:/usr/local/bin",
    before  => Class['stanbol::service'],
    require => File["${stanbol::params::home_dir}"]
  }

  file { "/etc/init.d/stanbol":
    content  => template("stanbol/init.erb"),
    mode     => '775'
  }
}
