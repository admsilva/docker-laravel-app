#!/usr/bin/env sh
set -e

chown -R ${1}:${2} /app
chmod -R 775 /app
chmod -R 755 /var/log/nginx
chmod -R 755 /var/cache/nginx
chmod -R 755 /etc/nginx

exec nginx -g "daemon off;"