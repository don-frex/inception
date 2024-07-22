#!/bin/sh

#create SSL Certificate
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MO/L=KH/O=1337/OU=student/CN=asaber.1337.ma"

cat -e /etc/ssl/certs/nginx-selfsigned.crt
ls -l /etc/nginx/sites-enabled
nginx -g "daemon off;"