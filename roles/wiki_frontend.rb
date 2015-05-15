name "wiki_frontend"
description "A front end server, holding Apache"
override_attributes(
  "apache" => {
    "dir" => "/var/www/html"
  }
)
run_list [
    "recipe[mysql::client]",
    "recipe[php]",
    "recipe[apache2]",
    "recipe[apache2::mod_php5]",
    "recipe[git]"
    ]

