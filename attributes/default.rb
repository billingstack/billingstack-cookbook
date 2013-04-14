# Copyright 2013 Mirantis Inc
#
# Author: Endre Karlson <endre.karlson@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.
#
# Cookbook Configuration

default['billingstack']['version'] = nil
default['billingstack']['rabbit_search'] = 'recipes:rabbitmq AND chef_environment:#{node.chef_environment}'
default['billingstack']['mysql_search'] = 'recipes:mysql\:\:server AND chef_environment:#{node.chef_environment}'

# billingstack [DEFAULT] Configuration
default['billingstack']['DEFAULT']['verbose'] = true
default['billingstack']['DEFAULT']['debug'] = false
default['billingstack']['DEFAULT']['state_path'] = '/var/lib/billingstack'
default['billingstack']['DEFAULT']['logdir'] = '/var/log/billingstack'
default['billingstack']['DEFAULT']['use_syslog'] = false
default['billingstack']['DEFAULT']['syslog_log_facility'] = 'LOG_LOCAL0'
default['billingstack']['DEFAULT']['notification_driver'] = 'billingstack.openstack.common.notifier.no_op_notifier'
default['billingstack']['DEFAULT']['policy_file'] = 'policy.json'
default['billingstack']['DEFAULT']['policy_default_rule'] = 'default'

default['billingstack']['DEFAULT']['allowed_rpc_exception_modules'] = 'billingstack.exceptions, billingstack.openstack.common.exception'
default['billingstack']['DEFAULT']['enabled_extensions_v1'] = 'none'
default['billingstack']['DEFAULT']['cors_allowed_origin'] = '*'
default['billingstack']['DEFAULT']['cors_max_age'] = 3600

default['billingstack']['DEFAULT']['rabbit_hosts'] = nil
default['billingstack']['DEFAULT']['rabbit_use_ssl'] = false
default['billingstack']['DEFAULT']['rabbit_userid'] = 'guest'
default['billingstack']['DEFAULT']['rabbit_password'] = 'guest'
default['billingstack']['DEFAULT']['rabbit_virtual_host'] = '/'
default['billingstack']['DEFAULT']['rabbit_durable_queues'] = false
default['billingstack']['DEFAULT']['rabbit_ha_queues'] = false
default['billingstack']['DEFAULT']['kombu_ssl_version'] = nil
default['billingstack']['DEFAULT']['kombu_ssl_keyfile'] = nil
default['billingstack']['DEFAULT']['kombu_ssl_certfile'] = nil
default['billingstack']['DEFAULT']['kombu_ssl_ca_certs'] = nil

# billingstack [service:api] Configuration
default['billingstack']['service:api']['api_host'] = '0.0.0.0'
default['billingstack']['service:api']['api_port'] = 9001
default['billingstack']['service:api']['auth_strategy'] = 'noauth'


# BS [service:central] Configuration
default['billingstack']['service:central']['storage_driver'] = 'sqlalchemy'

# BS [service:invoice] Configuration
default['billingstack']['service:invoice']['storage_driver'] = 'sqlalchemy'

# BS [service:payments] Configuration
default['billingstack']['service:payments']['storage_driver'] = 'sqlalchemy'

# BS [service:rating] Configuration
default['billingstack']['service:rating']['storage_driver'] = 'sqlalchemy'

# Central storage
default['billingstack']['storage:sqlalchemy']['database_connection'] = 'sqlite:///$state_path/billingstack.sqlite'
default['billingstack']['storage:sqlalchemy']['connection_debug'] = 0
default['billingstack']['storage:sqlalchemy']['connection_trace'] = false
default['billingstack']['storage:sqlalchemy']['sqlite_synchronous'] = true
default['billingstack']['storage:sqlalchemy']['idle_timeout'] = 3600
default['billingstack']['storage:sqlalchemy']['max_retries'] = 10
default['billingstack']['storage:sqlalchemy']['retry_interval'] = 10

# Rating Storage
default['billingstack']['rating:sqlalchemy']['database_connection'] = 'sqlite:///$state_path/billingstack.sqlite'
default['billingstack']['rating:sqlalchemy']['connection_debug'] = 0
default['billingstack']['rating:sqlalchemy']['connection_trace'] = false
default['billingstack']['rating:sqlalchemy']['sqlite_synchronous'] = true
default['billingstack']['rating:sqlalchemy']['idle_timeout'] = 3600
default['billingstack']['rating:sqlalchemy']['max_retries'] = 10
default['billingstack']['rating:sqlalchemy']['retry_interval'] = 10

# Payment storage
default['billingstack']['payment:sqlalchemy']['database_connection'] = 'sqlite:///$state_path/billingstack.sqlite'
default['billingstack']['payment:sqlalchemy']['connection_debug'] = 0
default['billingstack']['payment:sqlalchemy']['connection_trace'] = false
default['billingstack']['payment:sqlalchemy']['sqlite_synchronous'] = true
default['billingstack']['payment:sqlalchemy']['idle_timeout'] = 3600
default['billingstack']['payment:sqlalchemy']['max_retries'] = 10
default['billingstack']['payment:sqlalchemy']['retry_interval'] = 10

# Invoice stage
default['billingstack']['invoice:sqlalchemy']['database_connection'] = 'sqlite:///$state_path/billingstack.sqlite'
default['billingstack']['invoice:sqlalchemy']['connection_debug'] = 0
default['billingstack']['invoice:sqlalchemy']['connection_trace'] = false
default['billingstack']['invoice:sqlalchemy']['sqlite_synchronous'] = true
default['billingstack']['invoice:sqlalchemy']['idle_timeout'] = 3600
default['billingstack']['invoice:sqlalchemy']['max_retries'] = 10
default['billingstack']['invoice:sqlalchemy']['retry_interval'] = 10
