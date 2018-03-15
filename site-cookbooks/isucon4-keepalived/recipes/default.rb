#
# Cookbook Name:: proxy-keepalived
# Recipe:: default
#
# Copyright 2018, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'keepalived'
include_recipe 'grabeni'

template '/etc/keepalived/master.sh' do
  source 'master.sh.erb'
  mode '0755'
  notifies :restart, "service[keepalived]", :immediately
end

template '/etc/keepalived/conf.d/keepalived.conf' do
  source 'keepalived.conf.erb'
  notifies :restart, "service[keepalived]", :immediately
end

 service "keepalived" do
  supports :start => true,:realod => true, :restart => true, :enable => true
end              
