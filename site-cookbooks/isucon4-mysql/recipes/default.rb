#
# Cookbook Name:: isucon4-mysql
# Recipe:: default
#
# Copyright 2018, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
mysql_service 'foo' do
  port '3306'
  version '5.5'
  initial_root_password ''
  action [:create, :start]
end

mysql_config 'foo' do
  instance 'foo'
  source 'my.cnf'
  action :create
  notifies :restart, 'mysql_service[foo]', :immediately
end
