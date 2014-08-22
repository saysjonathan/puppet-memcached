# =Class: memcached::config
# This class manages the memcached config file
#
# =Parameters:
# config_content:: config file content [template]
# config_file:: path of memcached config file [string]
# config_source:: config file source [stirng]

class memcached::config (
  $config_content,
  $config_file,
  $config_source
) {
  if $config_source and $config_content {
    err( "${module_name}::config: config_content and config_source cannot both be specified" )
  } elsif !$config_source and !$config_content {
    err( "${module_name}::config: one of the following must be specified: config_content and config_source" )
  } elsif $config_source {
    $content = undef
    $source  = $config_source
  } elsif $config_content {
    $content = $config_content
    $source  = undef
  }

  anchor { "${module_name}::config::begin": }
  ->
  file { $config_file:
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    content => $config_content,
    source  => $config_source
  }
  ->
  anchor { "${module_name}::config::end": }
}
