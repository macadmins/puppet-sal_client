class sal_client::windows_install {
  $server = $sal_client::server
  $key    = $sal_client::key
  $source = $sal_client::source
  $gosal  = $sal_client::gosal_version

  $hash = Hash(['key',$key,'url',$server])

  if $sal_client::gosal_config {
    $gosal_config = lookup('sal_client::gosal_config')
    $merged = deep_merge($hash, $gosal_config)
  } else {
    $merged = $hash
  }

  # we are going to fail unless its windows 10 or better for now
  # need to include a dependancy on powershell 3 or better to get full support
  if versioncmp($facts['os']['release']['full'], '10') >= 0 {

    $install_dir = 'C:/ProgramData/Sal'

    file { $install_dir:
      ensure => 'directory',
    }

    file { "${install_dir}/Gosal.exe":
      ensure => 'file',
      source => "${source}/${gosal}"
    }

    file { "${install_dir}/config.json":
      ensure  => file,
      content => sorted_json($merged, true, 2)
    }
  }
}
