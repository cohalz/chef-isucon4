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
  command "cd /home/ec2-user/isucon4/qualifier/webapp/go; ./build.sh"
  action :run
  environment(
    "GOPATH" => "/home/ec2-user/gocode",
    "PATH" => "/usr/local/go/bin:#{ENV["PATH"]}"
  )
end

include_recipe 'supervisor'

supervisor_service 'isucon_go' do
    action :enable
    autostart true
    user 'ec2-user'
    directory '/home/ec2-user/isucon4/qualifier/webapp/go'
    command '/home/ec2-user/isucon4/env.sh ./golang-webapp'
end

