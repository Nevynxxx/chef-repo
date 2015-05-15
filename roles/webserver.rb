name "webserver"
description "Base role applied to all webserver nodes, enables nagios monitoring of http."
run_list(
	"recipe[apache2]",
	"recipe[php::source]"
)
