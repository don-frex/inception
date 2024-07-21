FROM debian:12

RUN apt update -y && \
	apt upgrade -y && \
    apt install -y nginx openssl curl

COPY ./conf/default /etc/nginx/sites-available/

COPY ./tools/nginx_configuration.sh /

ENTRYPOINT	["bash", "/nginx_configuration.sh"]