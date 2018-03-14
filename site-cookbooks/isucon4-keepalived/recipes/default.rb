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
  source 'master.sh.erb'
  mode '0755'
  notifies :reload, "service[keepalived]", :immediately
end

template '/etc/keepalived/conf.d/keepalived.conf' do
  source 'keepalived.conf.erb'
  notifies :reload, "service[keepalived]", :immediately
end

credentials = Chef::EncryptedDataBagItem.load('credentials','cohalz-test')

template '/home/ec2-user/.bashrc' do
  user 'ec2-user'
  group 'ec2-user'
  source 'bashrc'
  variables ({
    :access_key => credentials['AWS_ACCESS_KEY_ID'],
    :secret_access_key => credentials['AWS_SECRET_ACCESS_KEY'],
    :region => credentials['AWS_REGION']
  })
  notifies :reload, "service[keepalived]", :immediately
end

 service "keepalived" do
  supports :start => true,:realod => true, :restart => true, :enable => true
end              
