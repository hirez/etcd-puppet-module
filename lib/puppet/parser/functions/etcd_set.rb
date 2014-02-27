require 'etcd'

module Puppet::Parser::Functions
  newfunction(:etcd_set, :type => :rvalue, :arity => -2, :doc => "Lashup.") do |args|
    key = args[0]
    value = args[1]
    host = args[2]

    raise ArgumentError, ("etcd_set(): wrong number of arguments (#{args.length}; must be <= 3)") if args.length > 3

    client = Etcd.client(host: host)
    raise Puppet::ParseError, "Couldn't connect to '#{host}' during etcd_set()" if !client

    result = client.set("/config/puppet/#{key}", value)

    result or raise Puppet::ParseError, "Couldn't set '#{key}' to '#{value}' during etcd_set()"
  end
end
