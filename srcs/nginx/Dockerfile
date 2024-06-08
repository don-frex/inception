# Use the official Debian Buster image as a base
FROM debian:buster

# Install Nginx
RUN apt-get update && \
    apt-get install -y nginx openssl
RUN apt-get install curl -y

# Copy custom configuration file
#COPY conf.d/default.conf /etc/nginx/conf.d/default.conf

COPY ./tools/nginx_configuration.sh /tmp/

RUN chmod +x /tmp/nginx_configuration.sh && /tmp/nginx_configuration.sh
# Expose port 443
EXPOSE 443

# Start Nginx
# ENTRYPOINT ["nginx", "-g", "daemon off;"]