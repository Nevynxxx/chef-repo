name "monitoring"
description "Monitoring server"
run_list(
  "recipe[nagios::server]",
  "recipe[postfix]"
)

override_attributes(
  "nagios" => { "http_port"=>"443","https"=>"1","enable_sll"=>"1","notifications_enabled"=>"1","install_method"=>"package"}
  "postfix" => { "myhostname"=>"inf-nag01","mydomain"=>"ifl.manc.ifeltd.com", "mail_type" => "master"}
)
default_attributes(
  "nagios" => {
    "server_auth_method" => "htauth"
  }
)
