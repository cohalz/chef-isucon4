#
# Cookbook Name:: lb-proxy
# Recipe:: default
#
# Copyright 2018, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "haproxy" do
    action :install
end

template '/etc/haproxy/haproxy.cfg' do
    source 'haproxy.cfg'
    notifies :restart, "service[haproxy]", :immediately
end

service "haproxy" do
    supports :start => true, :restart => true, :enable => true
end
