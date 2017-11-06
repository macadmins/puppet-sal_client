class sal_client (
  $server,
  $key,
  $install_type,
  $source,
  $version,
  $gosal_version,
  $macos_version,
  $skip_facts,
  $sync_scripts,
  $basic_auth,
  $payload_organization,
){
  case $facts['os']['name'] {
    'Darwin': {
      include xcode_tools
      class {'sal_client::install':
        require => Class['xcode_tools']
      }
      -> class {'sal_client::config': }
      -> Class['sal_client']
    }
    'Windows': {
      class {'sal_client::windows_install': }
      -> Class['sal_client']
    }
  }
}
