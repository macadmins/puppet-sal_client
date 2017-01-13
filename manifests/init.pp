class sal_client (
  $server,
  $key,
  $version = 'be344955be812825fbca1d75b68252efd7bdfec5',
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
