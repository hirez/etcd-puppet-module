# == Class: ../modules/etcd Package
#
# etcd package.
#
class etcd::package {

  $key = 'THING_api/nodes/node2'
  $fred = etcd_get($key,'blep','172.24.55.142')

  notice("etcd_get of ${key} returns ${fred}")

  $wkey = 'THING_redis/secondary_master'
  $bill = etcd_wait($wkey,'plob','172.24.55.142')

  notice("etcd_wait on ${wkey} returns ${bill}")
}
