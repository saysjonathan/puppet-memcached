# =Class: memcached::defaults
# This class manages the default values for the memcached class

class memcached::defaults {
  # OS-specific defaults
  case $operatingsystem {
    Debian,Ubuntu: {
      $package     = 'memcached'
      $service     = 'memcached'
      $config_file = '/etc/memcached.conf'
    }
    CentOS,RedHat: {
      $package     = 'memcached'
      $service     = 'memcached'
      $config_file = '/etc/sysconfig/memcached'
    }
    default: {
      err( "${module_name} has not yet been implemented on $operatingsystem" )
    }
  }
}
