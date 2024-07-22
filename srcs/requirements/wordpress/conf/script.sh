#!/bin/bash

if ! [ -f /var/www/html/wp-config.php ]
then
	wp --allow-root --path=/var/www/html/ core download
	wp --allow-root --path=/var/www/html/ config create --dbname=$db1_name --dbuser=$db1_user --dbpass=$db1_pwd --dbhost=mariadb:3306
	wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_PASS --admin_email=$WP_EMAIL --skip-email --allow-root
	wp user create $db1_user $WP_UEMAIL --role=author --user_pass=$db1_pwd --allow-root
	wp theme install astra --activate --allow-root
else
	echo the config file is already in there !!
fi
/usr/sbin/php-fpm8.2 -F