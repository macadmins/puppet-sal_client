class sal_client::service {
  if versioncmp($sal_client::macos_version, '2.1.0') > -1{
    service {'com.salopensource.sal.runner':
      ensure    => 'running',
      enable    => true,
      subscribe => Apple_Package['sal_scripts']
    }

    service {'com.salopensource.sal.random.runner':
      ensure    => 'running',
      enable    => true,
      subscribe => Apple_Package['sal_scripts']
    }
  }
}
