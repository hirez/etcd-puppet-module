etcd-puppet-module
==================

0xbad1dea

Make etcd calls from puppet.

usage
=====

It's a puppet module. Drop it in yr puppet tree and stand well back.

Things you will need on yr puppetmaster:

'gem install etcd'

Then apply the included patch b/c the gem's a bit shonky.
(And a bit surplus for this application...)

You will find three new Puppet functions/calls/things:

etcd_set(key,default,etcd-server)

etcd_get(key,default,etcd_server)

etcd_wait(key,default,etcd_server)

The keys, entirely arbitrarily, live in /config/puppet.

etcd_get will return a string or an array, depending on your key being an endpoint or a directory.

etcd_wait, er, waits for a key to either burst into existance or change. As yet it has no timeout.

'default' is a default value and thus useless for the purposes of etcd_wait.

'etcd-server' is an IP address.

Errors and omissions expected.

Boilerplate
===========



To see all available rake tasks:

  rake -T

To validate your puppet manifests:

  rake validate

To lint your puppet manifests:

  rake lint

To package your puppet module, to upload somewhere (e.g. Forge):

  rake package

To generate module documentation:

  rake doc
