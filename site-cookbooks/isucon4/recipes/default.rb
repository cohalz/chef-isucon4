#
# Cookbook Name:: isucon4
# Recipe:: default
#
# Copyright 2018, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
git "/home/isucon/isucon4" do
  user "isucon"
  repository "https://github.com/isucon/isucon4.git"
  action :sync
end

template '/home/isucon/.bashrc' do
  source '.bashrc'
end

template '/home/isucon/.bash_profile' do
  source '.bash_profile'
end

template '/home/isucon/isucon4/env.sh' do
  source 'env.sh'
end

template '/etc/nginx/conf.d/isucon4.conf' do
  source 'nginx.conf'
end
