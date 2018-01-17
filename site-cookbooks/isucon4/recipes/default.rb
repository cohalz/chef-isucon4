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

template '/home/ec2-user/isucon4/env.sh' do
  source 'env.sh'
end

template '/etc/nginx/conf.d/isucon4.conf' do
  source 'nginx.conf'
end
