package "mysql-server" do
  action   :upgrade
  options "--force-yes"
end


package "git" do
  action  :upgrade
  options "--force-yes"
end


deploy "/home/vagrant/billingstack" do
  symlink_before_migrate Hash.new
  repo "git://github.com/billingstack/billingstack"
  user "billingstack"
  enable_submodules true
  migrate false
  action :deploy
  scm_provider Chef::Provider::Git
end