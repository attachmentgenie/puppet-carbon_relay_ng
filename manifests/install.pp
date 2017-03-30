#
class carbon_relay_ng::install inherits carbon_relay_ng {

  group { $carbon_relay_ng::group:
    ensure => present
  } -> user { $carbon_relay_ng::user:
    ensure => present,
    groups => $carbon_relay_ng::group,
    shell  => '/sbin/nologin'
  }

  if $carbon_relay_ng::package_manage {
    package { $carbon_relay_ng::package_name:
      ensure  => $carbon_relay_ng::package_ensure,
      require => [
        User[$carbon_relay_ng::user],
        Group[$carbon_relay_ng::group]
      ]
    }

  }

}
