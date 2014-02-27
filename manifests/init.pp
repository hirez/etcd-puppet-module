# == Class: etcd
#
# etcd puppet hiera module.
#
# === Examples
#
#  include etcd
#  or
#  class { 'etcd': }
#
# === Authors
#
# John Hawkes-Reed <john.hawkes-reed@futurenet.com>
#
class etcd {

  anchor{ 'etcd::start': } ->
  class { 'etcd::package': } ~>
  class { 'etcd::config': } ~>
  class { 'etcd::service': } ~>
  anchor{ 'etcd::end': }

}
