#
# Cookbook Name:: isucon4
# Recipe:: default
#
# Copyright 2018, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
git "/home/ec2-user/isucon4" do
  repository "https://github.com/isucon/isucon4.git"
    user "ec2-user"
    group "ec2-user"
  action :sync
end

template '/home/ec2-user/.bashrc' do
  source '.bashrc'
end

template '/home/ec2-user/.bash_profile' do
  source '.bash_profile'
end

template '/home/ec2-user/isucon4/env.sh' do
  source 'env.sh'
  owner 'ec2-user'
  group 'ec2-user'
  mode '0755'
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

mysql_database_user "isucon" do
    connection mysql_connection_info
    password "isucon"
    privileges [:all]
    action [:create, :grant]
end

execute "init db" do
    command "sh /home/ec2-user/isucon4/qualifier/init.sh"
    action :run
end


gem_package "gondler" do
    action :install
end


