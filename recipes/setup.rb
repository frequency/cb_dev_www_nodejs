#
# Cookbook Name:: newui
# Recipe:: setup
#
# copyright (C) 2015 Frequency
#
# All rights reserved - Do Not Redistribute
#

execute "what am i" do
time = Time.now.to_i  
  cwd '/tmp'
  command "mkdir -p freq-cb_newui_setup_#{time}"
  action :run
end

execute "upgrade to node 5.1.0" do
   command "/usr/local/bin/npm cache clean -f && /usr/local/bin/npm install -g n && /usr/local/bin/n 5.1.0"
   action :run
end

execute "restart node service via monit" do
   command "/usr/bin/monit restart all"
   action :run
end

