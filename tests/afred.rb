#!/usr/bin/env ruby
#

host = '172.24.55.142'
key1 = 'THING_api/nodes/node1'
value1 = '111.222.333.111'
key2 = 'THING_api/nodes/node2'
value2 = '111.222.333.222'

result = `curl -s -L http://127.0.0.1:4001/v2/keys/config/puppet/#{key1} -XPUT -d value=#{value1}`
puts result.inspect
result = `curl -s -L http://127.0.0.1:4001/v2/keys/config/puppet/#{key2} -XPUT -d value=#{value2}`
puts result.inspect
