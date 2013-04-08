# rconfig-service cookbook

This is a simple cookbook designed to do only a few things:

1. Deploy and configure a tftp server.
2. Reconfigure an existing tftp server.
3. Retrieve router configuration payloads from a Chef server on a
   periodic basis so they can shared via tftp.

# Requirements

* Cookbook supports many flavors of linux.

# Usage

* Add `rconfig-servce::default` recipe to run_list.

# Attributes

* There are no `rconfig-service` specific attributes, but there are a
  list of attributes from the depenedency cookbook (tftp) that you might
  want to override.  These are listed below:

`default['tftp']['directory']` - Directory where router configurations
are served from.
`default['tftp']['username']` - Owner of tftpd process.
`default['tftp']['address']` - <ip_address:port> that tftpd will listen
on.

# Recipes

* `rconfig-service::default` - deploy tftp server, and deposit router
  configurations from the `${COOKBOOK_DIRECTORY}/files/default`
  directory.

# Author

Author:: Tim Green (<tgreen@opscode.com>)
