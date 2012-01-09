class stanbol {
	require stanbol::params

	package { "openjdk-6-jdk":
		ensure => installed
	}

	include stanbol::install, stanbol::config, stanbol::service
}
