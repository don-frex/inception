# mariadb/Dockerfile
FROM debian:12

RUN apt update && apt install mariadb-server -y

RUN sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /run/mysql /var/lib/mysql /var/run/mysqld

COPY ./tools/script.sh /

CMD ["bash", "/script.sh"]