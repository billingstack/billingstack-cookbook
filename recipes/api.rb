# Cookbook Name:: billingstack-cookbook
# Recipe:: api
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

include_recipe "billingstack::common"

# Install the billingstack API package
package "billingstack-api" do
  action   :upgrade
  version  node['billingstack']['version']
end

# Write out the api-paste configuration file
template "/etc/billingstack/api-paste.ini" do
  source  "api-paste.ini.erb"
  owner   "billingstack"
  group   "billingstack"
  mode    0660
end

# Enable + Start the billingstack API service
service "billingstack-api" do
  supports    :restart => true, :status => true
  action      [:enable, :start]
  subscribes  :restart, resources(:template => "/etc/billingstack/billingstack.conf")
  subscribes  :restart, resources(:template => "/etc/billingstack/api-paste.ini")
end
