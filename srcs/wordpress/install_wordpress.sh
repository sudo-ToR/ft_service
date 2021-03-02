#!/bin/sh
mkdir /run/nginx
mkdir -p www/wp
openrc boot
rc-update add nginx default
rc-update add php-fpm7 default
rc-service php-fpm7 start
rc-service nginx start
adduser -D -g 'wp' wp
chown -R wp:wp /www/
chown -R nginx /www/
chmod -R  777 nginx /www/
chmod -R 777 wp /www/
cd /www/wp
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
mv /tmp/wp-config.php /www/wp
su - wp -c 'wp core download --path=/www/wp'
su - wp -c 'wp core install --url=172.17.0.2:5050 --title=Example --admin_user=admin --admin_password=password --admin_email=info@example.com --skip-email --path=/www/wp/'
su - wp -c 'wp user create test1 test1@example.com --role=author --path=/www/wp'
su - wp -c 'wp user create test2 test2@example.com --role=editor --path=/www/wp'
su - wp -c 'wp user create test3 test3@example.com --role=contributor --path=/www/wp'
