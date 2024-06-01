# nginx/Dockerfile
FROM nginx:latest

# Copy custom Nginx configuration file to the container
COPY ./default.conf /etc/nginx/conf.d/default.conf

# Expose port 80 to the host
EXPOSE 80

# Start Nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]
