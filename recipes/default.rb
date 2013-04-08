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
  mode 0666
end
