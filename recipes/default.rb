#
# Cookbook Name:: rconfig-service
# Recipe:: default
#
# Copyright (C) 2013 Tim Green
# 
# All rights reserved - Do Not Redistribute
#

include_recipe 'tftp::server'

cookbook_file "#{node['tftp']['directory']}/router.cfg" do
  backup false
  action :create_if_missing
  owner node['tftp']['username']
  mode 0644
end
