#!/usr/bin/env ruby
#

require 'etcd'

host = '172.24.55.142'
key = 'EFS_Redis/primary_master'

client = Etcd.client(host:  host)
puts "Couldn't connect to '#{host}' during etcd_set()" if !client

result = client.get("/config/puppet/#{key}").value

puts result.inspect
