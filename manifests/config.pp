class sal_client::config {
  $server = $sal_client::server
  $key    = $sal_client::key
  $skip_facts = $sal_client::skip_facts
  $sync_scripts = $sal_client::sync_scripts
  $basic_auth = $sal_client::basic_auth
  $payload_organization = $sal_client::payload_organization
  $report_puppet_state = $sal_client::report_puppet_state
  $use_binary_plist = $sal_client::use_binary_plist

  $profile = {
    'PayloadContent' => [
      {
        'PayloadContent' => {
          'com.github.salopensource.sal' => {
            'Forced' => [
              {
                'mcx_preference_settings' => {
                  'key' => $key,
                  'ServerURL' => $server,
                  'SyncScripts' => $sync_scripts,
                  'SkipFacts' => $skip_facts,
                  'BasicAuth' => $basic_auth,
                  'ReportPuppetState' => $report_puppet_state,
                }
              }
            ]
          }
        },
        'PayloadEnabled' => true,
        'PayloadIdentifier' => 'MCXToProfile.47cf3472-100c-41c2-af0f-9745fe7cfe11.alacarte.customsettings.9c656755-0a61-4059-a92c-0d761f8a2557',
        'PayloadType' => 'com.apple.ManagedClient.preferences',
        'PayloadUUID' => '9c656755-0a61-4059-a92c-0d761f8a2557',
        'PayloadVersion' => 1
      }
    ],
    'PayloadDescription' => "Configuration for Sal for ${payload_organization}",
    'PayloadDisplayName' => 'Settings for Sal',
    'PayloadIdentifier' => 'com.github.salopensource.sal',
    'PayloadOrganization' => $payload_organization,
    'PayloadRemovalDisallowed' => true,
    'PayloadScope' => 'System',
    'PayloadType' => 'Configuration',
    'PayloadUUID' => '47cf3472-100c-41c2-af0f-9745fe7cfe11',
    'PayloadVersion' => 1
  }

  # We use binary by default to prevent the content of the plist being logged, as
  # older verisons of puppet can crash with content large bodies being passed to the logs.    
  if $use_binary_plist  {
    mac_profiles_handler::manage { 'com.github.salopensource.sal':
      ensure      => present,
      file_source => plist($profile, binary),
      type        => 'template',
    }
  } else  {
    mac_profiles_handler::manage { 'com.github.salopensource.sal':
      ensure      => present,
      file_source => plist($profile),
      type        => 'template',
    }
  }
}
