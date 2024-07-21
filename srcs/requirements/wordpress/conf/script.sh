#!/bin/bash


sleep 5


# sed -i "s/wordpress/$db1_name/g"   wp-config.php
# sed -i "s/myuser/$db1_user/g"  wp-config.php
# sed -i "s/mypassword/$db1_pwd/g"    wp-config.php
# sed -i "s/db/$db1_name/g"    wp-config.php


wp --allow-root --path=/var/www/html/ core download

wp --allow-root --path=/var/www/html/ config create --dbname=$db1_name --dbuser=$db1_user --dbpass=$db1_pwd --dbhost=mariadb:3306

wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_PASS --admin_email=$WP_EMAIL --skip-email --allow-root

wp user create $db1_user $WP_UEMAIL --role=author --user_pass=$db1_pwd --allow-root

wp theme install astra --activate --allow-root


# wp plugin install redis-cache --activate --allow-root

# wp plugin update --all --allow-root


 
# sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

# mkdir /run/php



# wp redis enable --allow-root

/usr/sbin/php-fpm8.2 -F