#!/bin/sh
mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
mv /etc/phpmyadmin/config.inc.php /etc/phpmyadmin/config.inc.php.orig 
mv /tmp/nginx.conf /etc/nginx/
mv /tmp/config.inc.php /etc/phpmyadmin/
adduser -D -g 'www' www
chown -R www:www /var/lib/nginx
chown -R www:www /www
mkdir /run/nginx
chmod -R 777 /usr/share/webapps/
chmod 0644 /etc/phpmyadmin/config.inc.php
ln -s /usr/share/webapps/phpmyadmin /www/phpmyadmin