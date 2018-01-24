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

