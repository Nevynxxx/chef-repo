name "mail_filter"
description "mail filter role"
run_list [
    "recipe[postfix]",
    "recipe[amavisd]"
    ]

