# Use the official Debian Buster image as a base
FROM debian:buster

# Install Nginx
RUN apt-get update && \
    apt-get install -y nginx openssl && \
	apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Update package lists and install curl
RUN apt-get update && apt-get install -y curl

#remove default config
RUN	rm -f /etc/nginx/nginx.conf

# Copy custom configuration file
COPY conf.d/default.conf /etc/nginx/nginx.conf

# Copy static website files (if any)
# COPY Applight/* /usr/share/nginx/html

# Copy and execute custom nginx configuration script
COPY ./tools/nginx_configuration.sh /tmp/
RUN chmod +x /tmp/nginx_configuration.sh
# Expose port 443
EXPOSE 80

# Start Nginx
ENTRYPOINT	["sh", "/tmp/nginx_configuration.sh"]


