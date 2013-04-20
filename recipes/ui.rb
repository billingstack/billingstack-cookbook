# Cookbook Name:: billingstack-cookbook
# Recipe:: ui
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

# Install the billingstack API package
package "apache2" do
  action   :upgrade
  options "--force-yes"
end

deploy "/var/www/billingstack" do
    repo "git://github.com/billingstack/billingstack-ui"
    user "billingstack"
    enable_submodules true
    action :deploy
    scm_provider Chef::Provider::Git
end

# Write out the api-paste configuration file
template "/var/www/billingstack/app/config.js" do
  source  "config.js.erb"
  owner   "www-data"
  group   "www-data"
  mode    0660
end