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

mysql2_chef_gem 'default' do
  client_version node['mysql']['version'] if node['mysql']
  action :install
end

mysql_connection_info = {
  :host     => '127.0.0.1',
  :username => 'root',
  :password => ''
}

mysql_database_user 'isucon' do
  connection    mysql_connection_info
  password      'isucon'
  host          '%'
  privileges    [:all]
  action        :grant
end
