#
# Cookbook Name:: resque_web
# Recipe:: default
#

if ['solo', 'util'].include?(node[:instance_role])
  
  package "sys-apps/ey-monit-scripts" do
    action :install
    version "0.17"
  end

  node[:applications].each do |app, data|
    template "/etc/monit.d/resque_web.monitrc" do 
    owner 'root' 
    group 'root' 
    mode 0644 
    source "monitrc.conf.erb" 
    variables({ 
      :app_name => app
    })
    end
  end
end