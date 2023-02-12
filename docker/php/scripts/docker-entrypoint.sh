#!/bin/bash
set -e

chown -R $USER:$GROUP /app
chmod -R 775 /app

composer install
php artisan key:generate

exec php-fpm -c /usr/local/etc/php-fpm.conf