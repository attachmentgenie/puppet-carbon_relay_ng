# == Class: carbon_relay_ng::params
#
# Full description of class carbon_relay_ng here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'carbon_relay_ng':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Marc Lambrichs <marc.lambrichs@gmail.com>
#
# === Copyright
#
# Copyright 2016 Marc Lambrichs
#
class carbon_relay_ng::params {
  $admin_addr               = $::ipaddress
  $admin_port               = 2004
  $bad_metrics_max_age      = '24h'
  $configfile               = 'carbon-relay-ng.ini'
  $configfile_group         = 'root'
  $configfile_owner         = 'root'
  $config_dir               = '/etc/carbon-relay-ng'
  $graphite_host            = 'localhost'
  $graphite_interval        = 1000
  $graphite_port            = 2003
  $group                    = 'carbon-relay-ng'
  $http_addr                = $::ipaddress
  $http_port                = 8081
  $instance                 = 'default'
  $legacy_metric_validation = 'strict'
  $listen_addr              = $::ipaddress
  $listen_port              = 2003
  $log_level                = 'notice'
  $manage_service           = true
  $max_procs                = 2
  $package_ensure           = installed
  $package_manage           = true
  $package_name             = 'carbon-relay-ng'
  $pickle                   = false
  $pid_file                 = 'carbon-relay-ng.pid'
  $pid_dir                  = '/var/run/carbon-relay-ng'
  $routes                   = {}
  $service_ensure           = 'running'
  $service_enable           = true
  $service_manage           = true
  $spool                    = true
  $spool_dir                = '/var/spool/carbon-relay-ng'
  $user                     = 'carbon-relay-ng'
}
