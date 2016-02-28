# == Class: carbon_relay_ng::service
#
# Full description of class carbon_relay_ng here.
#
# === Parameters
#
#
class carbon_relay_ng::service inherits carbon_relay_ng {
  if !($carbon_relay_ng::service_ensure in ['running', 'stopped']) {
    fail('service_ensure parameter must be \'running\' or \'stopped\'')
  }

  if $carbon_c_relay::service_manage == true {

    file { $carbon_relay_ng::pid_dir:
      ensure => directory,
      group  => $carbon_relay_ng::group,
      mode   => '0644',
      owner  => $carbon_relay_ng::user,
      before => Service[$carbon_relay_ng::service_name]
    }

    file { $carbon_relay_ng::spool_dir:
      ensure => directory,
      group  => $carbon_relay_ng::group,
      mode   => '0644',
      owner  => $carbon_relay_ng::user,
      before => Service[$carbon_relay_ng::service_name]
    }

    service { $carbon_relay_ng::service_name:
      ensure     => $carbon_relay_ng::service_ensure,
      enable     => $carbon_relay_ng::service_enable,
      name       => $carbon_relay_ng::service_name,
      hasstatus  => true,
      hasrestart => true,
    }
  }

}
