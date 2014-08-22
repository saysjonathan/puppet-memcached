puppet-memcached
===

This module installs and configures memcached

## Usage
This class requires that either config_content or config_source be specified when calling:

### config_content
```
class { 'memcached':
  config_content => template("${module_name}/memcached.conf.erb")
}
```

### config_source
```
class { 'memcached':
  config_source => "puppet:///modules/${module_name}/memcached.conf"
}
```

## Additional Parameters
The following additional parameters may be specified:
  * config_file: Path to the config file
  * package: memcached package name(s)
  * service: memcached service name

## Puppet Functions
A helper function is included to assist with setting a percentage of memory in the memcached config. This function can be called from a config
template:

```
...
<% Puppet::Parser::Functions.function('memory_percentage') -%>
-m <%= function_memory_percentage('90') %>
...
```
