class sal_client (
  $gosal_config = undef,
  $server,
  $key,
  $source,
  $gosal_version,
  $macos_version,
  $macos_checksum,
  $macos_receipt,
  $skip_facts,
  $sync_scripts,
  $basic_auth,
  $payload_organization,
  $http_username,
  $http_password,
  $report_puppet_state,
){
  case $facts['os']['family'] {
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
    'Debian': {
      class {'sal_client::debian_install': }
      -> Class['sal_client']
    }
  }
}
