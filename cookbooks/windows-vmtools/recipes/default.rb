#
# Cookbook Name:: windows-vmtools
# Recipe:: default
#
# Copyright 2012, Anthony Metcalf
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
remote_file "c:/windows/temp/setup64.exe" do
  source "http://192.168.0.119/setup64.exe"
end
 
execute "c:/windows/temp/setup64.exe /S /v\"/qn REBOOT=R\"" do
  action :nothing
  subscribes :run, resources(:remote_file => "c:/windows/temp/setup64.exe")
end
