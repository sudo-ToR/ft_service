#!/bin/sh
chmod -R  777 nginx /www/
openrc boot
rc-update add nginx default
rc-update add php-fpm7 default
rc-service php-fpm7 start
rc-service nginx start

