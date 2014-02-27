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


What is this I don't even.
==========================

Sometimes it turns out to be quite handy to be able to bring up a collection of puppet-managed machines 
in a hurry and all at once without prior knowledge of machine-name or IP address. For instance in a Jenkins-driven 
test environment. In that case, you need some method for the various machines to signal their purpose and identity 
so other machines can connect to them. For instance a Redis master/slave pair. You also need to be able to make the 
slave box wait around for the master to announce its presence so it can connect to same.

You could achieve this with a lot of cut, paste and swear of your hiera configs.

Or you could muck around with a shared config-management DB.

I chose option two because it was more interesting.



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
