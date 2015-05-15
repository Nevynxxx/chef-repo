name "base"
description "Base role applied to all nodes."
run_list(
  "recipe[noc-users]",
  "recipe[selinux::disabled]",
  "recipe[sudo]",
  "recipe[yum]",
  "recipe[zsh]",
  "recipe[git]",
  "recipe[build-essential]",
  "recipe[iptables]",
  "recipe[ntp]",
  "recipe[chef-client::delete_validation]",
  "recipe[chef-client::config]",
  "recipe[chef-client::service]",
  "recipe[nagios::client]"
)
override_attributes(
  :authorization => {
    :sudo => {
      "groups" => ["wheel"],
      "passwordless" => true
    }
  }
)
