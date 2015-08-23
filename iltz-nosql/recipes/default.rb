#
# Cookbook Name:: iltz-nosql
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# fix the damned passwords

include_recipe "couchbase::server"

couchbase_bucket "default" do
  memory_quota_mb 100
  #replicas 2
  replicas false

  username "admin"
  password "admin"
end

couchbase_bucket "iltzbucket" do
  #memory_quota_percent 0.5
  memory_quota_mb 100
  replicas false
  #saslPassword "bucketPassword"

  username "admin"
  password "admin"
end

couchbase_bucket "memcached" do
  memory_quota_mb 100
  replicas false
  type "memcached"

  username "admin"
  password "admin"
end
