class sal_client (
  $server,
  $key,
  $version = '9d2e693d0cb709db421b474549a1e525f18d29b3',
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
