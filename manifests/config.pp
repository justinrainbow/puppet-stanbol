class stanbol::config {
  # file { [ $stanbol::params::config_dir, $stanbol::params::log_dir, $stanbol::params::data_dir, $stanbol::params::work_dir]:
  #   ensure  => directory,
  #   owner   => 'root',
  #   group   => 'root',
  #   mode    => '0755',
  #   notify  => Class['stanbol::service'],
  #   require => Class['stanbol::install'],
  # }
  # 
  # file { "${stanbol::params::config_dir}/stanbol.yml":
  #   ensure  => present,
  #   source  => 'puppet:///modules/stanbol/stanbol.yml',
  #   owner   => 'root',
  #   group   => 'root',
  #   mode    => '0644',
  #   notify  => Class['stanbol::service'],
  #   require => [ Class['stanbol::install'], File[$stanbol::params::config_dir] ],
  # }
  # 
  # file { "${stanbol::params::home_dir}/bin/service/stanbol.conf":
  #   ensure  => present,
  #   content => template('stanbol/es-servicewrapper.conf.erb'),
  #   owner   => 'root',
  #   group   => 'root',
  #   mode    => '0644',
  #   notify  => Class['stanbol::service'],
  #   require => Class['stanbol::install'],
  # }
}