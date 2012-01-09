class stanbol::params {
	$version = $stanbol_version ? {
		''      => '0.16.1',
		default => $stanbol_version,
	}

	$source_url = $stanbol_source_url ? {
		''       => 'http://dev.iks-project.eu/downloads/stanbol-launchers/org.apache.stanbol.launchers.stable-0.9.0-incubating-SNAPSHOT.jar',
		default  => $stanbol_source_url,
	}

	$unpack_root = $stanbol_unpack_root ? {
		''      => '/opt',
		default => $stanbol_unpack_root,
	}

	$home_dir    = "${unpack_root}/stanbol"
	$scripts_dir = "${home_dir}/bin"

	$min_mem = $stanbol_min_mem ? {
		''      => '256',
		default => $stanbol_min_mem,
	}

	$max_mem = $stanbol_max_mem ? {
		''      => '1024',
		default => $stanbol_max_mem,
	}
}