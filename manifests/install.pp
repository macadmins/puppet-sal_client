class sal_client::install {
  $source = $sal_client::source
  $macos_version = $sal_client::macos_version
  $checksum = $sal_client::macos_checksum
  $receipt = $sal_client::macos_receipt

  $package_source = "${source}/sal_scripts-${macos_version}.pkg"

    if versioncmp($macos_version, '2.1.0') == -1 {
      $installs = [
        '/usr/local/munki/preflight.d',
        '/usr/local/sal/utils.py',
        '/usr/local/munki/preflight.d'
        ]
    } else {
      $installs = [
        '/usr/local/munki/preflight.d',
        '/usr/local/sal/utils.py',
        '/usr/local/munki/preflight.d',
        '/usr/local/sal/bin',
        '/usr/local/sal/bin/sal-submit',
        '/Library/LaunchDaemons/com.salopensource.sal.runner.plist',
        '/Library/LaunchDaemons/com.salopensource.sal.random.runner.plist',
        '/usr/local/munki/report_broken_client'
        ]
    }
    apple_package { 'sal_scripts':
      source        => $package_source,
      version       => $macos_version,
      receipt       => $macos_receipt,
      installs      => $installs,
      force_install => false,
      http_username => $http_username,
      http_password => $http_password,
      http_checksum => $macos_checksum
    }

}
