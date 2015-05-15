name "default"
description "Basic services we want everywhere"
override_attributes(
  "chef_client" => {
    "server_url" => "https://api.opscode.com/organizations/ORGNAME",
    "validation_client_name" => "shatech-validator"
  },
  "authorization" => {
    "sudo" => {
      "groups" => ["wheel"],
      "passwordless" => true
    }
  }
)

run_list [
    "recipe[noc-users]",
    "recipe[sudo]",
    "recipe[iptables]",
    "recipe[ntp]",
    "recipe[chef-client::delete_validation]",
    "recipe[chef-client::config]",
    "recipe[chef-client::service]"
    ]

