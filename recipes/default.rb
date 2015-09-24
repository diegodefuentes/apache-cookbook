#
# Cookbook Name:: apache_softtek
# Recipe:: default
#
# Copyright (c) 2015 Diego De Fuentes Ceballos,
# Softtek All Rights Reserved.

package 'Install Apache' do
  case node[:platform]
  when 'amazon','redhat', 'centos', 'fedora'
    package_name 'httpd'
	action :install
  when 'ubuntu', 'debian'
    package_name 'apache2'
	action :install
  end
end

package 'Install SSL' do
  case node[:platform]
  when 'amazon','redhat', 'centos', 'fedora'
  	package_name 'mod_ssl'
	action :install
  when 'ubuntu', 'debian'
    package_name 'openssl'
	action :install
  end
end

service 'Apache' do
  case node[:platform]
  when 'amazon','redhat', 'centos', 'fedora'
  	service_name 'httpd'
  when 'ubuntu', 'debian'
    service_name 'apache2'
  end
  action [ :enable ]
end

execute 'enable_ssl' do
	command 'a2enmod ssl'
	action :nothing
end

template "#{node['apache']['appfolder']}/#{node['apache']['conffile']}" do
  source "#{node['apache']['conffile']}.erb"
  mode '0644'
  notifies :restart, 'service[Apache]'
end

template "#{node['apache']['appfolder']}/#{node['apache']['conffolder']}/ssl.conf" do
  case node[:platform]
  when 'amazon','redhat', 'centos', 'fedora'
  source 'ssl.conf.erb'
  mode '0644'
  when 'ubuntu', 'debian'
  notifies :run, 'execute[enable_ssl]', :immediately
  source 'ssl.conf.erb'
  mode '0644'
  end
  notifies :restart, 'service[Apache]'
end

template "#{node['apache']['appfolder']}/envvars" do
  case node[:platform]
  when 'amazon','redhat', 'centos', 'fedora'
  action :nothing
  when 'ubuntu', 'debian'
  source 'envvars.erb'
  mode '0644'
  end
  notifies :restart, 'service[Apache]'
end

template "#{node['apache']['appfolder']}/#{node['apache']['extraconf']}/charset.conf" do
  case node[:platform]
  when 'amazon','redhat', 'centos', 'fedora'
  action :nothing
  when 'ubuntu', 'debian'
  source 'charset.conf.erb'
  mode '0644'
  end
  notifies :restart, 'service[Apache]'
end

template "#{node['apache']['appfolder']}/#{node['apache']['extraconf']}/ports.conf" do
  case node[:platform]
  when 'amazon','redhat', 'centos', 'fedora'
  action :nothing
  when 'ubuntu', 'debian'
  source 'ports.conf.erb'
  mode '0644'
  end
  notifies :restart, 'service[Apache]'
end

template "#{node['apache']['appfolder']}/#{node['apache']['extraconf']}/security.conf" do
  case node[:platform]
  when 'amazon','redhat', 'centos', 'fedora'
  action :nothing
  when 'ubuntu', 'debian'
  source 'security.conf.erb'
  mode '0644'
  end
  notifies :restart, 'service[Apache]'
end

template "#{node['apache']['appfolder']}/#{node['apache']['extraconf']}/serve-cgi-bin.conf" do
  case node[:platform]
  when 'amazon','redhat', 'centos', 'fedora'
  action :nothing
  when 'ubuntu', 'debian'
  source 'serve-cgi-bin.conf.erb'
  mode '0644'
  end
  notifies :restart, 'service[Apache]'
end