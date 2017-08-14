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

   scheduled_task { 'gosal':
     ensure    => present,
     enabled   => true,
     command   => "${install_dir}/Gosal.exe",
     trigger   => {
       enabled    => 'true',
       index      => '0',
       schedule   => 'once',
       start_time => '00:00',
       start_date => '2017-8-14',
       minutes_duration => '4294967295',
       minutes_interval => '30',
       user => 'system'
     }
   }
 }
}
