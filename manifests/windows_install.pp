class sal_client::windows_install {
  $server = $sal_client::server
  $key    = $sal_client::key
  $source = $sal_client::source
  $gosal  = $sal_client::gosal_version

  # we are going to fail unless its windows 10 or better for now
  # need to include a dependancy on powershell 3 or better to get full support
  if versioncmp($facts['os']['release']['full'], '10') >= 0 {

    $install_dir = "C:/ProgramData/Sal"

    file { $install_dir:
      ensure => 'directory',
    }

    file { "${install_dir}/Gosal.exe":
      ensure => 'file',
      source => "${source}/${gosal}"
   }

   file { "${install_dir}/config.json":
      ensure => file,
      content => template('sal_client/gosal_win.json.erb')
   }

   scheduled_task { 'Run Gosal every half hour':
     ensure    => present,
     enabled   => true,
     command   => "${install_dir}/Gosal.exe",
     trigger   => {
       schedule   => daily,
       every      => 1,
       start_time => '00:00',
       minutes_interval => '30',
     }
   }
 }
}
