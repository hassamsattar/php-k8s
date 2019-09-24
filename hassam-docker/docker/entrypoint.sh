#!/usr/bin/env bash

echo $@
PROJECT=laravel-app
if [ "$1" = "install.sh" ];
then
    echo "Running install script"
    $1
elif [ "$1" = "upgrade.sh" ]
then
    echo "Running upgrade script"
    $1;
else
    cd /var/www/${PROJECT};

    : >> /var/www/${PROJECT}/storage/logs/laravel.log

    tail -f /var/www/${PROJECT}/storage/logs/laravel.log &

    exec "$@";
fi