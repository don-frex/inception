#!/bin/sh

#create SSL Certificate
mkdir -p /etc/nginx/certificate

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/certificate/asaber.key -out /etc/nginx/certificate/asaber.crt -subj /C=MA/ST=GLM/L=guelmim/O=1337/OU=42Network/CN=asaber

# Écrire la configuration de NGINX dans nginx.conf



nginx -g daemon off;