# == Class: carbon_relay_ng::config
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
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class carbon_relay_ng::config (
  $admin_addr               = $carbon_relay_ng::admin_addr,
  $admin_port               = $carbon_relay_ng::admin_port,
  $bad_metrics_max_age      = $carbon_relay_ng::bad_metrics_max_age,
  $graphite_host            = $carbon_relay_ng::graphite_host,
  $graphite_interval        = $carbon_relay_ng::graphite_interval,
  $graphite_port            = $carbon_relay_ng::graphite_port,
  $http_addr                = $carbon_relay_ng::http_addr,
  $http_port                = $carbon_relay_ng::http_port,
  $instance                 = $carbon_relay_ng::instance,
  $legacy_metric_validation = $carbon_relay_ng::legacy_metric_validation,
  $listen_addr              = $carbon_relay_ng::listen_addr,
  $listen_port              = $carbon_relay_ng::listen_port,
  $log_level                = $carbon_relay_ng::log_level,
  $max_procs                = $carbon_relay_ng::max_procs,
  $routes                   = $carbon_relay_ng::routes,
  $pid_file                 = $carbon_relay_ng::pid_file,
  $spool_dir                = $carbon_relay_ng::spool_dir
) {

  file { $carbon_relay_ng::config_dir:
    ensure => directory,
    mode   => '0755',
    owner  => $carbon_relay_ng::configfile_owner,
    group  => $carbon_relay_ng::configfile_group
  } ->
  file { "${carbon_relay_ng::config_dir}/${carbon_relay_ng::configfile}":
    content => template('carbon_relay_ng/carbon-relay-ng.ini.erb'),
    mode    => '0644',
    owner   => $carbon_relay_ng::configfile_owner,
    group   => $carbon_relay_ng::configfile_group
  }
}
