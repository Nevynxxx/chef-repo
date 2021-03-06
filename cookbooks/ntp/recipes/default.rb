#
# Cookbook Name:: ntp
# Recipe:: default
# Author:: Joshua Timberman (<joshua@opscode.com>)
#
# Copyright 2009, Opscode, Inc
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

case node[:platform] 
when "ubuntu","debian"
  package "ntpdate" do
    action :install
  end
end

#group "ntp" do
#  action :create
#end
#
#user "ntp" do
#  comment "NTP User"
#  system true
#  shell "/bin/fasle"
#  action :create
#end

package "ntp" do
  action :install
end

service node[:ntp][:service] do
  action :start
end

# ntpstats dir doesn't exist on RHEL/CentOS
# It'd be better to not make assumptions about the target platform
%w{ /var/lib/ntp /var/log/ntpstats }.each do |ntpdir|
  directory ntpdir do
    owner "root"
    group "root"
    mode 0755
  end
end

template "/etc/ntp.conf" do
  source "ntp.conf.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, "service[ntp]"
end

service "ntp" do
  service_name node[:ntp][:service]
  action [:enable, :start]
end
