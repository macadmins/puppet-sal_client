class sal_client (
  $server,
  $key,
  $version = '17f26f3876d60ac8f8884e7b39851c3ebd425f42',
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
