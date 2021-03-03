#!/bin/sh
chmod -R  777 /www/
if ! $(wp core is-installed); then
su - wp -c 'wp core install --url=172.17.0.2:5050 --title=Example --admin_user=admin --admin_password=password --admin_email=info@example.com --skip-email --path=/www/wp/'
su - wp -c 'wp user create test1 test1@example.com --role=author --path=/www/wp' 
su - wp -c 'wp user create test2 test2@example.com --role=editor --path=/www/wp' 
su - wp -c 'wp user create test3 test3@example.com --role=contributor --path=/www/wp'
fi
