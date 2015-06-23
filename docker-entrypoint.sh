#!/bin/bash
set -e

/sensu-config 

run-client () { 
	sed -i "/address/s/127.0.0.1/${COREOS_PUBLIC_IPV4}/" /etc/sensu/conf.d/client.json
	/opt/sensu/bin/sensu-client -d /etc/sensu/conf.d
} 
case $SENSU_ROLE in
	"server") /opt/sensu/bin/sensu-server -d /etc/sensu/conf.d;;
	"api") /opt/sensu/bin/sensu-api -d /etc/sensu/conf.d;;
	"client") run-client;;
	*) echo "no such role"
esac

exec "$@"
