mysql_install_db --user=root --datadir=/var/lib/mysql

sleep 5

echo "FLUSH PRIVILEGES;" > /tmp/init.sql

echo "CREATE USER IF NOT EXISTS '${db1_user}'@'%' IDENTIFIED BY '${db1_pwd}';" >> /tmp/init.sql

echo "CREATE DATABASE IF NOT EXISTS ${db1_name};" >> /tmp/init.sql

echo "GRANT ALL PRIVILEGES ON ${db1_name}.* TO '${db1_user}'@'%' WITH GRANT OPTION;" >> /tmp/init.sql

echo "FLUSH PRIVILEGES;" >> /tmp/init.sql

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${db1_root_pwd}';" >> /tmp/init.sql
 

mariadbd --bootstrap --user=root < /tmp/init.sql

mariadbd --user=root