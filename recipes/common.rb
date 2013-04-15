# Cookbook Name:: billingstack-cookbook
# Recipe:: common
#
# Copyright 2013, Endre Karlson <endre.karlson@gmail.com>
#
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
include_recipe "billingstack::repository"

# Find the RabbitMQ nodes with search, if necessary
rabbit_hosts = node['billingstack']['DEFAULT']['rabbit_hosts']

if Chef::Config[:solo] and rabbit_hosts.nil?
  Chef::Application.fatal!("You must set node['billingstack']['DEFAULT']['rabbit_hosts'] in chef-solo mode.")
elsif rabbit_hosts.nil?
  rabbit_hosts = search("node", node['billingstack']['rabbit_search'])

  if rabbit_hosts.empty?
    Chef::Application.fatal!("Search was unable to find any rabbit hosts.")
  else
    rabbit_hosts.map! do |member|
      "#{member['ipaddress']}:#{member['rabbitmq']['port']}"
    end
  end
end

# # Find the Database Connection Info
# database_connection = node['billingstack']['storage:sqlalchemy']['database_connection']

# if Chef::Config[:solo] and database_connection['host'].nil?
#   Chef::Application.fatal!("You must set node['billingstack']['storage:sqlalchemy']['database_connection']['host'] in chef-solo mode.")
# elsif database_connection['host'].nil?
#   mysql_hosts = search("node", node['billingstack']['mysql_search'])

#   if mysql_hosts.empty?
#     Chef::Application.fatal!("Search was unable to find any mysql hosts.")
#   else
#     # Pick the first MySQL sever
#     mysql_host = mysql_hosts[0]

#     node.set['billingstack']['storage:sqlalchemy']['database_connection']['host'] = mysql_host['ipaddress']
#   end
# end

# Install the billingstack-common package
package "billingstack-common" do
  action   :install
  version  node['billingstack']['version']
end

# Write out the main billingstack config file
template "/etc/billingstack/billingstack.conf" do
  source     "billingstack.conf.erb"
  owner      "billingstack"
  group      "billingstack"
  mode       0660
  variables  :rabbit_hosts => rabbit_hosts
end
