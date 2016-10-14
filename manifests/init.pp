class sal_client (
  $server,
  $key,
  $version = 'e5183f79e9642166861149b2af7be6a7c45278e5',
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
