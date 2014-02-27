#!/usr/bin/env ruby

require 'etcd'

host = '172.24.55.142'
key = 'THING_api/nodes/node1'

client = Etcd.client(host:  host)
puts "Couldn't connect to '#{host}' during etcd_set()" if !client

result = client.get("/config/puppet/#{key}")

avalue = Array.new

if result.node.dir
  result.node.nodes.each do |node|
    avalue << node['value']
  end
  stuff = avalue
else
  stuff = result.node.value
end

puts stuff.inspect
