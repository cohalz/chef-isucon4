#
# Cookbook Name:: test-mysql
# Recipe:: default
#
# Copyright 2018, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
mysql_service 'foo' do
    port '3306'
    version '5.5'
    initial_root_password 'abc'
    action [:create, :start]
end
