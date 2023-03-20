#!/bin/bash
set -e

composer install
php artisan key:generate

exec php-fpm -c /usr/local/etc/php-fpm.conf