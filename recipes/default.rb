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

case node[:platform]
when 'centos','redhat','fedora'
case node[:platform_version]
 when '6.6'
  template '/etc/httpd/conf/httpd.conf' do
  source 'httpd.conf56.erb'
  mode '0644'
  notifies :restart, 'service[Apache]'
 end
  when '7.1'
  template '/etc/httpd/conf/httpd.conf' do
  source 'httpd.conf7.erb'
  mode '0644'
  notifies :restart, 'service[Apache]'
 end
 end
 when 'ubuntu', 'debian'
  template '/etc/apache2/apache2.conf' do
  source 'apache.conf.erb'
  mode '0644'
  notifies :restart, 'service[Apache]'
  end
end
 
case node[:platform]
when 'centos','redhat','fedora'
case node[:platform_version]
when '5.11'
  template '/etc/httpd/conf.d/ssl.conf' do
  source 'ssl.conf5.erb'
  mode '0644'
  notifies :restart, 'service[Apache]'
 end
 when '6.6'
  template '/etc/httpd/conf.d/ssl6.conf' do
  source 'ssl.conf.erb'
  mode '0644'
  notifies :restart, 'service[Apache]'
 end

end
 when 'ubuntu', 'debian'
  template '/etc/apache2/conf-available/ssl.conf' do
  source 'ssl.conf.erb'
  mode '0644'
  notifies :restart, 'service[Apache]'
  end
end