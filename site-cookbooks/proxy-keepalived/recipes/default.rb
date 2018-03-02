#
# Cookbook Name:: proxy-keepalived
# Recipe:: default
#
# Copyright 2018, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'keepalived'


template '/etc/keepalived/master.sh' do
  source 'master.sh'
end

template '/etc/keepalived/conf.d/keepalived.conf' do
  source 'keepalived.conf'
  notifies :restart, "service[keepalived]", :immediately
end

 service "keepalived" do
  supports :start => true, :restart => true, :enable => true
end              
