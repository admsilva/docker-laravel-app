#!/bin/bash
set -e

cp /app/.env.example /app/.env
composer install
php artisan key:generate

exec php-fpm -c /usr/local/etc/php-fpm.conf