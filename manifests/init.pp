# == Class: carbon_relay_ng
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
class carbon_relay_ng (
  $admin_addr               = $carbon_relay_ng::params::admin_addr,
  $admin_port               = $carbon_relay_ng::params::admin_port,
  $bad_metrics_max_age      = $carbon_relay_ng::params::bad_metrics_max_age,
  $config_dir               = $carbon_relay_ng::params::config_dir,
  $configfile               = $carbon_relay_ng::params::configfile,
  $configfile_owner         = $carbon_relay_ng::params::configfile_owner,
  $configfile_group         = $carbon_relay_ng::params::configfile_group,
  $graphite_host            = $carbon_relay_ng::params::graphite_host,
  $graphite_interval        = $carbon_relay_ng::params::graphite_interval,
  $graphite_port            = $carbon_relay_ng::params::graphite_port,
  $group                    = $carbon_relay_ng::params::group,
  $http_addr                = $carbon_relay_ng::params::http_addr,
  $http_port                = $carbon_relay_ng::params::http_port,
  $instance                 = $carbon_relay_ng::params::instance,
  $legacy_metric_validation = $carbon_relay_ng::params::legacy_metric_validation,
  $listen_addr              = $carbon_relay_ng::params::listen_addr,
  $listen_port              = $carbon_relay_ng::params::listen_port,
  $log_level                = $carbon_relay_ng::params::log_level,
  $manage_service           = $carbon_relay_ng::params::manage_service,
  $max_procs                = $carbon_relay_ng::params::max_procs,
  $package_ensure           = $carbon_relay_ng::params::package_ensure,
  $package_manage           = $carbon_relay_ng::params::package_manage,
  $pickle                   = $carbon_relay_ng::params::pickle,
  $pid_file                 = $carbon_relay_ng::params::pid_file,
  $pid_dir                  = $carbon_relay_ng::params::pid_dir,
  $routes                   = $carbon_relay_ng::params::routes,
  $service_ensure           = $carbon_relay_ng::params::service_ensure,
  $service_enable           = $carbon_relay_ng::params::service_enable,
  $spool                    = $carbon_relay_ng::params::spool,
  $spool_dir                = $carbon_relay_ng::params::spool_dir,
  $user                     = $carbon_relay_ng::params::user,
) inherits carbon_relay_ng::params {

  validate_absolute_path(
    $config_dir,
    $pid_dir,
    $spool_dir
  )

  validate_bool(
    $manage_service,
    $package_manage,
    $pickle,
    $service_enable,
    $spool
  )

  validate_hash( $routes )

  validate_integer(
    $admin_port,
    $graphite_interval,
    $graphite_port,
    $http_port,
    $listen_port,
    $max_procs
  )

  validate_ip_address(
    $admin_addr,
    $http_addr,
    $listen_addr
  )

  validate_string(
    $bad_metrics_max_age,
    $configfile_group,
    $configfile_owner,
    $graphite_host,
    $group,
    $instance,
    $legacy_metric_validation,
    $log_level,
    $pid_file,
    $user
  )

  anchor { 'carbon_relay_ng::begin': } ->
  class { '::carbon_relay_ng::install': } ->
  class { '::carbon_relay_ng::config': } ~>
  class { '::carbon_relay_ng::service': } ->
  anchor { 'carbon_relay_ng::end': }

}
