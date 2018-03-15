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
  rm -rf grabeni_linux_amd64/
  chmod +x /usr/bin/grabeni
  EOH
  not_if { ::File.exist?('/home/ec2-user/grabeni_linux_amd64.tar.gz') }
end

credentials = Chef::EncryptedDataBagItem.load('credentials','cohalz-test')

template '/home/ec2-user/.bashrc' do
  user 'ec2-user'
  group 'ec2-user'
  source 'bashrc'
  variables ({
    :access_key => credentials['AWS_ACCESS_KEY_ID'],
    :secret_access_key => credentials['AWS_SECRET_ACCESS_KEY'],
    :region => credentials['AWS_REGION']
  })
end
