#
# Cookbook Name:: grabeni
# Recipe:: default
#
# Copyright 2018, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
bash 'install grabeni' do 
  user 'root'
  cwd  '/home/ec2-user'
  code <<-EOH
  wget https://github.com/yuuki/grabeni/releases/download/v0.4.2/grabeni_linux_amd64.tar.gz
  tar zxfv grabeni_linux_amd64.tar.gz
  mv grabeni_linux_amd64/grabeni /usr/bin/
  chmod +x /usr/bin/grabeni
  EOH
end
