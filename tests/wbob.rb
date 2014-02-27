#!/usr/bin/env ruby
#

require 'etcd'

host = '172.24.55.142'
key = 'THING_test/wait_key'

client = Etcd.client(host:  host)
puts "Couldn't connect to '#{host}' during etcd_set()" if !client

result = client.watch("/config/puppet/#{key}").value

puts result.inspect
