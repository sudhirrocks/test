#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "apache2" do
    action :install
end

service "apache2" do
    action [:enable, :restart]
end
execute "rm /etc/apache2/sites-available/test.conf" do
     only_if do
            File.exist?("/etc/apache2/sites-available/test.conf")
    end
end
include_recipe "php::default"
