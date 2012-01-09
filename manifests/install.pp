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
    command => "wget ${stanbol::params::source_url}",
    cwd     => "${stanbol::params::home_dir}",
    creates => "${stanbol::params::home_dir}/org.apache.stanbol.launchers.stable-0.9.0-incubating-SNAPSHOT.jar",
    path    => "/usr/bin:/usr/local/bin",
    before  => Class['stanbol::service'],
    require => File["${stanbol::params::home_dir}"]
  }

  file { "${stanbol::params::scripts_dir}/run-stanbol-server.sh":
    content  => template("stanbol/run-stanbol-server.sh.erb"),
    mode     => '775'
  }

  file { "/etc/init/stanbol.conf":
    content  => template("stanbol/upstart.erb"),
    mode     => '644'
  }
}
