#
# Cookbook Name:: dawebsite
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe "pm2"
include_recipe "nginx"

template "/etc/nginx/sites-enabled/default" do
  source "default.erb"
  variables(
    :site_fqdn => "#{node[:site_fqdn]}"
  )
  notifies :restart, "service[nginx]", :delayed
end

%w[ /var /var/app /var/app/nodejs /etc/pm2 /etc/pm2/conf.d ].each do |path|
  directory path do
    owner 'root'
    group 'root'
    mode '0755'
    action :nothing
  end.run_action(:create)
end

cookbook_file '/var/app/nodejs/hello.js' do
  source 'hello.js'
  owner 'nobody'
  mode '0755'
  action :create
  notifies :start_or_reload, 'pm2_application[hello.js]', :delayed
end

pm2_application 'hello.js' do
  script 'hello.js'
  cwd '/var/app/nodejs'
end
