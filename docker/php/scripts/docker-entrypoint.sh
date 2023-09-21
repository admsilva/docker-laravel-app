#!/usr/bin/env sh
set -e

chown -R ${1}:${2} /app
chmod -R 775 /app

cp /app/.env.example /app/.env
composer install
php artisan key:generate

exec php-fpm -c /usr/local/etc/php-fpm.conf