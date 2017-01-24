class sal_client (
  $server,
  $key,
  $version = '5f7193e22831d83c4bb0be0e52b3960019f8a7ee',
  $skip_facts = [],
  $sync_scripts = true,
  $basic_auth = true,
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
