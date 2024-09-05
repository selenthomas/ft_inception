#!/bin/sh

#set -eux

if [ -d "/var/lib/mysql/${MYSQL_DATABASE}" ]
then 
	echo "Database already exists"
else

service mariadb start;
sleep 10
service mariadb status;
mysql -uroot -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mysql -uroot -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -uroot -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -uroot -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`root\`@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysql -uroot -e "FLUSH PRIVILEGES;"

mysqladmin -uroot -p${MYSQL_ROOT_PASSWORD} shutdown

fi
#kill $(cat /var/run/mysqld/mysqld.pid)

exec mysqld

echo "MariaDB database and user were created successfully! "