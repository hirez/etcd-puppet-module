#!/usr/bin/env ruby
#

require 'etcd'

host = '127.0.0.1'
key = 'THING_redis/secondary_master'
value = '192.168.0.1'

result = `curl -L http://127.0.0.1:4001/v2/keys/config/puppet/#{key} -XPUT -d value=#{value}`


puts result.inspect
