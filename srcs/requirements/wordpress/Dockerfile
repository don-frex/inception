# # wordpress/Dockerfile
# FROM debian:buster

# # Install dependencies
# RUN apt-get update && apt-get upgrade -y && apt-get install -y \
#     php-fpm \
# 	php-mysql \
#     curl \
#     wget \
#     unzip \
#     && rm -rf /var/lib/apt/lists/*

# # Set working directory
# WORKDIR /var/www/html

# # Download and extract WordPress
# RUN wget https://wordpress.org/latest.tar.gz && \
#     tar -xvzf latest.tar.gz && \
#     rm latest.tar.gz && \
#     mv wordpress/* . && \
#     rm -rf wordpress

# # Set permissions
# RUN chown -R www-data:www-data /var/www/html

# # Copy custom WordPress configuration if needed
# COPY ./config/wp-config.php /var/www/html/wp-config.php

# # Expose the port PHP-FPM runs on
# EXPOSE 9000

# # Start PHP-FPM
# CMD ["php-fpm7.3", "--nodaemonize"]

FROM alpine:3.20.1

RUN apk update && apk upgrade

RUN apk add --no-cache \
	php \
	php-fpm \
	php-phar

WORKDIR /var/www

RUN wget https://wordpress.org/latest.zip && \
	unzip latest.zip && \
	cp -rf wordpress/* . && \
	rm -rf wordpress latest.zip

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/script.sh .
RUN chmod +x script.sh

ENTRYPOINT [ "sh", "./script.sh" ]

CMD [ "php-fpm83", "-F" ]