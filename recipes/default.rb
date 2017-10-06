#
# Cookbook:: sips-office-server
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# Create dedicated user
user node['sips-office-server']['user']

# Copy archives from cookbook to node
cookbook_file '/tmp/sips_API_SERVER_206.tar' do
  source 'sips_API_SERVER_206.tar'
  owner node['sips-office-server']['user']
  group node['sips-office-server']['group']
end

# Extract archive
ark 'sips-office-server' do
  url 'file:///tmp/sips_API_SERVER_206.tar'
  owner node['sips-office-server']['user']
  group node['sips-office-server']['group']
  version '2.06'
  prefix_root node['sips-office-server']['install_dir_prefix']
  action :install
end

# Create log directory
directory '/var/log/sips-office-server' do
  owner   node['sips-office-server']['user']
  group   node['sips-office-server']['group']
end

# Install configuration files
template "#{node['sips-office-server']['install_dir_prefix']}/sips-office-server/server/config/config.xml" do
  source 'config.xml.erb'
  owner   node['sips-office-server']['user']
  group   node['sips-office-server']['group']
  notifies :restart, 'poise_service[sips-office-server]'
end

template "#{node['sips-office-server']['install_dir_prefix']}/sips-office-server/server/access/accessListCommand.xml" do
  source 'accessListCommand.xml.erb'
  owner   node['sips-office-server']['user']
  group   node['sips-office-server']['group']
  notifies :restart, 'poise_service[sips-office-server]'
end

template "#{node['sips-office-server']['install_dir_prefix']}/sips-office-server/server/access/accessListHttpRequest.xml" do
  source 'accessListHttpRequest.xml.erb'
  owner   node['sips-office-server']['user']
  group   node['sips-office-server']['group']
  notifies :restart, 'poise_service[sips-office-server]'
end

template "#{node['sips-office-server']['install_dir_prefix']}/sips-office-server/server/access/accessListService.xml" do
  source 'accessListService.xml.erb'
  owner   node['sips-office-server']['user']
  group   node['sips-office-server']['group']
  notifies :restart, 'poise_service[sips-office-server]'
end

template "#{node['sips-office-server']['install_dir_prefix']}/sips-office-server/server/access/password.conf" do
  source 'password.conf.erb'
  owner   node['sips-office-server']['user']
  group   node['sips-office-server']['group']
  notifies :restart, 'poise_service[sips-office-server]'
end

# Create service for running the application
poise_service_user 'sips'
poise_service 'sips-office-server' do
  command "/usr/bin/java -cp #{node['sips-office-server']['install_dir_prefix']}/sips-office-server/server/lib/apiServer.jar: -Djava.security.policy=#{node['sips-office-server']['install_dir_prefix']}/sips-office-server/server/rmi/client.policy -Dconfigfile=#{node['sips-office-server']['install_dir_prefix']}/sips-office-server/server/config/config.xml com.atosorigin.services.cad.apiserver.watchdog.ProcessWatchdog"
  node['sips-office-server']['user']
end

# Install components
%w(rsync unzip).each do |package| package package end
node['sips-office-server']['components'].each do |component_name, component_archive|
  # Copy component archive to node
  cookbook_file "/tmp/#{component_archive}" do
    source component_archive
    owner node['sips-office-server']['user']
    group node['sips-office-server']['group']
  end

  # Extract component archive
  ark component_name do
    url "file:///tmp/#{component_archive}"
    path "#{node['sips-office-server']['install_dir_prefix']}/sips-office-server"
    action :put
    notifies :restart, 'poise_service[sips-office-server]'
  end
end
