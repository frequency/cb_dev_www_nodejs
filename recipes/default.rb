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

bash 'update nodejs version and restart app' do
  code <<-"EOH"
    /usr/local/bin/npm cache clean -f
    /usr/local/bin/npm install -g n
    /usr/local/bin/n stable
    /usr/bin/monit stop node_web_app_frequency_new_ui
    /bin/sleep 15
    /usr/bin/monit start node_web_app_frequency_new_ui
  EOH
  action :run
end

