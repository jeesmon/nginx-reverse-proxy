#!/usr/bin/env sh
set -eu

cp ${NGINX_CONF_PATH} /tmp/nginx.conf
envsubst '${UPSTREAM_SERVICE_PROTOCOL} ${UPSTREAM_SERVICE_NAME} ${UPSTREAM_SERVICE_PORT}' < /tmp/nginx.conf > ${NGINX_CONF_PATH}
rm /tmp/nginx.conf

exec "$@"
