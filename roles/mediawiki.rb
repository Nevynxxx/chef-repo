name "mediawiki"
description "mediawiki front end application server."
run_list(
  "recipe[imagemagick]",
  "recipe[mysql::client]",
  "recipe[application]",
  "recipe[mediawiki::status]"
)
