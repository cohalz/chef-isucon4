#
# Cookbook Name:: test-golang-webapp
# Recipe:: default
#
# Copyright 2018, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#

#isuconユーザを作っておらずpathが異なっているので暫定対応
template '/home/ec2-user/isucon4/qualifier/webapp/go/build.sh' do
    source 'build.sh'
end


execute "build web-app" do
    command "cd /home/ec2-user/isucon4/qualifier/webapp/go; sudo sh build.sh"
end

include_recipe 'supervisor'

supervisor_service 'isucon_go' do
    action :enable
    autostart true
    autorestart true
    user 'ec2-user'
    directory '/home/ec2-user/isucon4/qualifier/webapp/go'
    command '/home/ec2-user/isucon4/env.sh ./golang-webapp'
end

