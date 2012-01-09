class stanbol::service {
	service { 'stanbol':
		ensure     => running,
		enable     => true,
		hasrestart => true,
		hasstatus  => true,
		require    => [ Class['stanbol::config'], Class['stanbol::install'] ],
	}
}
