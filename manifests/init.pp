# =Class: memcached
# This class manages installation and configuration of memecached
#
# =Parameters:
# config_content:: config file content [template]
# config_file:: path of memcached config file [string]
# config_source:: config file source [string]
# package:: name(s) of the memcached package [string, array]
# service:: name of the memcached service [string]

class memcached (
  $config_content = undef,
  $config_file    = $config_file,
  $config_source  = undef,
  $package        = $package,
  $service        = $service
) inherits memcached::defaults {
  anchor { "${module_name}::begin": }
  ->
  package { $package:
    ensure => installed
  }
  ->
  class { "${module_name}::config":
    config_content => $config_content,
    config_source  => $config_source
  }
  ->
  service { $service:
    enable    => true,
    ensure    => 'running',
    hasstatus => true
  }
  ->
  anchor { "${module_name}::end": }
}
