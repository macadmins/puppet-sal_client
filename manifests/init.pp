class sal_client (
  $server,
  $key,
  $version = 'e85b921d684b921db073541bb8fa1891c5e7418c',
  $skip_facts = [],
  $sync_scripts = true,
  $payload_organization = 'Sal Opensource',
){
  if $facts['os']['name'] == 'Darwin' {
    include xcode_tools
    class {'sal_client::install':
      require => Class['xcode_tools'],
    } ->
    class {'sal_client::config': } ->
    Class['sal_client']
  }
}
