FROM debian:12

RUN apt update && \
	apt upgrade -y && \
    apt install -y nginx openssl curl

COPY ./conf/default /etc/nginx/conf.d/default.conf

COPY ./tools/nginx_configuration.sh /

ENTRYPOINT	["bash", "/nginx_configuration.sh"]