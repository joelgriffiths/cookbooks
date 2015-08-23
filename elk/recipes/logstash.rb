#
# Cookbook Name:: elk
# Recipe:: logstash

######################################################
# https://supermarket.chef.io/cookbooks/logstash#readme
node.default['logstash']['instance_default']['version'] = \
node['elk']['logstash_version']
node.default['logstash']['instance_default']['java_home'] = \
'/usr/lib/jvm/java-8-oracle-amd64'
node.default['logstash']['instance_default']['init_method'] = 'native'

template '/etc/init.d/logstash_server' do
  source 'logstash_initscript.erb'
  mode 0755
  notifies :restart, 'service[logstash_server]', :delayed
end

#include_recipe 'logstash::source'
include_recipe 'logstash::server'
#include_recipe 'logstash::agent'
