require 'etcd'

module Puppet::Parser::Functions
  newfunction(:etcd_wait, :type => :rvalue, :arity => -2, :doc => "Lashup.") do |args|
    key = args[0]
    default = args[1]
    ehost = args[2]

    raise ArgumentError, ("etcd_wait(): wrong number of arguments (#{args.length}; must be <= 3)") if args.length > 3

    result = nil  
    client = Etcd.client(host: ehost)
    avalue = Array.new

    raise Puppet::ParseError, "Can't connect to etcd server #{ehost}" if !client

    edata = client.watch("/config/puppet/#{key}")

    if edata.node.dir
      edata.node.nodes.each do |node|
        avalue << node['value']
      end
      result = avalue
    else
      result = edata.node.value
    end

    result || default or raise Puppet::ParseError, "No match found for '#{key}' during etcd_wait()"
  end
end
