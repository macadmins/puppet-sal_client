class sal_client (
  $gosal_config = undef,
  $source,
  $gosal_version,
  $macos_version,
  $skip_facts,
  $sync_scripts,
  $basic_auth,
  $payload_organization,
){
  case $facts['os']['name'] {
    'Darwin': {
      class {'sal_client::install': }
      -> class {'sal_client::config': }
      -> class {'sal_client::service': }
      -> Class['sal_client']
    }
    'Windows': {
      class {'sal_client::windows_install': }
      -> Class['sal_client']
    }
  }
}
