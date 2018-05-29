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


## Requirements
* [stdlib](https://github.com/puppetlabs/puppetlabs-stdlib)
* [mac_stdlib](https://github.com/macadmins/puppet-mac_stdlib)
* [mac_profiles_handler](https://github.com/keeleysam/puppet-mac_profiles_handler)
