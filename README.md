# puppet-sal_client

Configuration of a Sal client using Puppet.

## Usage

``` yaml
# The url of your server (required)
sal_client::server: https://sal.company.com
# The client's key (required)
sal_client::key: abc123
# the version you're deploying
sal_client::macos_version: '2.1.0'
# Facts that shouldn't be sent to the server
sal_client::skip_facts:
    - 'some_fact'
    - 'some_other_fact'
# Whether the client will sync the client side scripts directly from the server or if they will be deployed manually
sal_client::sync_scripts: true
# Use basic auth (please don't turn this off!)
sal_client::basic_auth: true
# Organisation name displayed in the profile. Cosmetic.
sal_client::payload_organization: 'Sal Opensource'
```

### Optional Usage (Windows)

if you're installing the windows client for sal (gosal) you'll need to create a yaml representation of gosal's config file in hiera.  Here, the `management` key is optional if you want to send facter data to sal.

```yaml
sal_client::gosal_config:
  management:
    tool: puppet # tells gosal which config management tool you're using
    path: C:\Program Files\Puppet Labs\Puppet\bin\puppet.bat # tells gosal where the path to said tool is
    command: facts # the command used as an argument to the path/tool
```

### Optional Usage (Debian)

if you're installing the debian client for sal (gosal) you'll need to create a yaml representation of gosal's config file in hiera.  Here, the `management` key is optional if you want to send facter data to sal.

```yaml
sal_client::gosal_config:
  management:
    tool: puppet # tells gosal which config management tool you're using
    path: /opt/puppetlabs/bin/puppet # tells gosal where the path to said tool is
    command: facts # the command used as an argument to the path/tool
```

## Requirements

* [stdlib](https://github.com/puppetlabs/puppetlabs-stdlib)
* [client_stdlib](https://github.com/macadmins/puppet-client_stdlib)
* [mac_profiles_handler](https://github.com/keeleysam/puppet-mac_profiles_handler)
* [win_scheduled_task](https://github.com/bdemetris/puppet-win_scheduled_task) - windows only

