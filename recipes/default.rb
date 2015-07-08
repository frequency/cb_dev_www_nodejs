#
# Cookbook Name:: cb_dev_www_nodejs
# Recipe:: default
#
# Copyright (C) 2015 Frequency
#
# All rights reserved - Do Not Redistribute
#

execute "what am i" do
time = Time.now.to_i  
  cwd '/tmp'
  command "mkdir -p cb_dev_www_nodejs_#{time}"
  action :run
end

bash 'update and install components' do
  code <<-"EOH"
    /usr/bin/yum -y update
  EOH
  action :run
end

