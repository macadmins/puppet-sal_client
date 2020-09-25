class sal_client::debian_install {
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

  $install_dir = '/opt/sal'

  file { $install_dir:
    ensure => 'directory',
  }

  file { "${install_dir}/gosal":
    ensure => 'file',
    mode   => '0750',
    owner  => 'root',
    group  => 'root',
    source => "${source}/${gosal}"
  }

  file { "${install_dir}/config.json":
    ensure  => file,
    content => to_json_pretty($merged)
  }

  cron { 'SalCheckin':
    command => '/opt/sal/gosal --config /opt/sal/config.json',
    user    => 'root',
    hour    => '*',
    minute  => '*/15',
  }

}
