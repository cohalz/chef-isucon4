#
# Cookbook Name:: test-golang-webapp
# Recipe:: default
#
# Copyright 2018, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#


execute "build web-app" do
  user 'isucon'
  command "cd /home/isucon/isucon4/qualifier/webapp/go; ./build.sh"
  action :run
end

include_recipe 'supervisor'

supervisor_service 'isucon_go' do
    action :enable
    autostart true
    autorestart true
    user 'isucon'
    directory '/home/isucon/isucon4/qualifier/webapp/go'
    command '/home/isucon/isucon4/env.sh ./golang-webapp'
end

