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
  key: A-LONG-KEY-YOU-NEED-TO-PUT-IN
  url: https://sal.company.com/
  management:
    tool: puppet
    path: C:\Program Files\Puppet Labs\Puppet\bin\puppet.bat
    command: facts
```


## Requirements
* [stdlib](https://github.com/puppetlabs/puppetlabs-stdlib)
* [mac_stdlib](https://github.com/macadmins/puppet-mac_stdlib)
* [mac_profiles_handler](https://github.com/keeleysam/puppet-mac_profiles_handler)
