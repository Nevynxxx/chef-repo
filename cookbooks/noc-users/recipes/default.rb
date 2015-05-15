#
# Cookbook Name:: noc-users
# Recipe:: default
#
# Copyright 2011, Example Com
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
app = data_bag_item('apps', 'mediawiki')
user app['owner']
group app['group'] do
  members app['owner']
end

user "ametcalf" do
  comment "Anthony Metcalf"
  home "/home/ametcalf"
  shell "/bin/bash"
  password "$1$UJjOkk.0$VDQN6nHnp4j6azUO.k5cQ."
  supports :manage_home => true
end
  
user "mwinstone" do
  comment "Myles Winstone"
  home "/home/mwinstone"
  shell "/bin/bash"
  password "$6$tTLrjK0Q$MUUI65IcIK5J9g.OGd6/Xd.W1rihur9JehRkgsiD/V3r6Hnq6SNq5QOD4D/8/qjXUav1./3LNG3QjfRoJBfmr."
  supports :manage_home => true
end
  
user "images" do
  comment "Owns the Images repo for Mediawiki"
  home "/home/images"
  shell "/bin/bash"
  password "$1$UJjOkk.0$VDQN6nHnp4j6azUO.k5cQ."
  supports :manage_home => true
end
  
%w{ametcalf images}.each do |user|
  directory "/home/#{user}" do
    owner user
    group "users"
    mode "0755"
    action :create
  end
  
  %w{.vim .vim/backups .vim/cookies .vim/tmp .ssh}.each do |d|
    directory "/home/#{user}/#{d}" do
      owner user
      group "users"
      mode "0700"
      action :create
    end
  end
  
  %w{authorized_keys id_rsa id_rsa.pub}.each do |f|
    cookbook_file "/home/#{user}/.ssh/#{f}" do
      source "#{user}_#{f}"
      owner user
      group "users"
      mode "0600"
      action :create
    end
  end
  
  %w{screenrc vimrc}.each do |f|
    cookbook_file "/home/#{user}/.#{f}" do
      source f
      owner user
      group "users"
      mode "0600"
      action :create
    end
  end

  group "wheel" do
    append true
    members [user]
  end

end
