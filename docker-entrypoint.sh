#!/bin/bash
set -e

/sensu-config 

case $SENSU_ROLE in
	"server") /opt/sensu/bin/sensu-server -d /etc/sensu/conf.d;;
	"api") /opt/sensu/bin/sensu-api -d /etc/sensu/conf.d;;
	"client") /opt/sensu/bin/sensu-client -d /etc/sensu/conf.d;;
	*) echo "no such role"
esac

exec "$@"
