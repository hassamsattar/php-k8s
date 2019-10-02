#!/bin/sh

echo "* * * * * cd /var/www/laravel-app/ && php artisan schedule:run >> /dev/null 2>&1" > /etc/crontabs/root
/usr/sbin/crond -f -l 8
