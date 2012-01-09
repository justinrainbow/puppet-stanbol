class stanbol::service {
	service { 'stanbol':
		ensure     => running,
		enable     => true,
		provider   => "upstart",
		require    => [ Class['stanbol::config'], Class['stanbol::install'] ],
	}
}
