# mariadb/Dockerfile
FROM debian:buster

# Install MariaDB
RUN apt-get update && apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV MYSQL_ROOT_PASSWORD=my-secret-pw
ENV MYSQL_DATABASE=wordpress
ENV MYSQL_USER=myuser
ENV MYSQL_PASSWORD=mypassword

# Copy custom MariaDB configuration if needed
#COPY my.cnf /etc/mysql/my.cnf

# Expose the port MariaDB runs on
EXPOSE 3306

# Start MariaDB
CMD ["mysqld"]