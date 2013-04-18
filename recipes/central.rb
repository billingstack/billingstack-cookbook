# Cookbook Name:: billingstack-cookbook
# Recipe:: central
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

# Install the billingstack Central package
package "billingstack-central" do
  action   :upgrade
  options "--force-yes"
  version  node['billingstack']['version']
end

# Enable + Start the billingstack Central service
service "billingstack-central" do
  supports    :restart => true, :status => true
  action      [:enable, :start]
  subscribes  :restart, resources(:template => "/etc/billingstack/billingstack.conf")
end
