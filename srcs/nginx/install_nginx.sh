mv /tmp/nginx.conf /etc/nginx/
adduser -D -g 'www' www
mkdir /www/wordpress/
mkdir /www/phpmyadmin/
chown -R www:www /var/lib/nginx
chown -R www:www /www
mkdir /run/nginx
openrc boot
rc-update add nginx boot
# rc-update add php-fpm7 default
# rc-service php-fpm7 start
rc-service -S nginx start