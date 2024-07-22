
FROM debian:12

RUN apt update && apt upgrade -y

RUN apt install -y php8.2-fpm php8.2 php8.2-mysql curl

RUN sed -i "s|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/8.2/fpm/pool.d/www.conf

WORKDIR /var/www/html

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

RUN chown -R www-data:www-data /var/www/html

COPY 	./conf/script.sh /

RUN 	chmod +x /script.sh

CMD [ "/script.sh" ]
