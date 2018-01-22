#
# Cookbook Name:: create-user-isucon
# Recipe:: default
#
# Copyright 2018, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
user 'isucon' do
    password ''
    supports :manage_home => true
    action :create
end

group 'wheel' do
    action [:modify]
    members ['isucon']
    append true
end
