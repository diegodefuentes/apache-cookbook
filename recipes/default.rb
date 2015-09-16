#
# Cookbook Name:: apache_softtek
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

package 'Install Apache' do
  case node[:platform]
  when 'redhat', 'centos', 'fedora'
    package_name 'httpd'
	action :install
  when 'ubuntu', 'debian'
    package_name 'apache2'
	action :install
  end
end

package 'Install SSL' do
  case node[:platform]
  when 'redhat', 'centos', 'fedora'
  	package_name 'mod_ssl'
	action :install
  when 'ubuntu', 'debian'
    package_name 'openssl'
	action :install
  end
end

service 'Apache' do
 case node[:platform]
 when 'centos','redhat','fedora'
   service_name 'httpd'
 when 'ubuntu', 'debian'
   service_name 'apache2'
  end
  action [ :enable, :start ]
end

template '/etc/httpd/conf/httpd.conf' do
 source 'httpd.conf.erb'
 mode '0644'
 notifies :restart, 'service[Apache]'
 end
 
 template '/etc/httpd/conf.d/ssl.conf' do
 source 'ssl.conf.erb'
 mode '0644'
 notifies :restart, 'service[Apache]'
 end