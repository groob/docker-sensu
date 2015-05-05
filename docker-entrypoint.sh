#!/bin/bash
set -e

/sensu-config 

exec "$@"
