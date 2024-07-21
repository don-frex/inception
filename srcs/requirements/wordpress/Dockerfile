# # wordpress/Dockerfile
FROM debian:12

#insall dependancies
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    php-fpm \
	php-mysql \
    curl \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# # Set working directory
WORKDIR /var/www/html

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

# RUN wp core download --allow-root

# RUN mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

# Copy custom WordPress configuration if needed
# COPY ./conf/wp-config.php /

# RUN mv /wp-config.php /var/www/html/wp-config.php
# # Set permissions
RUN chown -R www-data:www-data /var/www/html

COPY 	./conf/script.sh /
RUN 	chmod +x /script.sh

CMD [ "/script.sh" ]