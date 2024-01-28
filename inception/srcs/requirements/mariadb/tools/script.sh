#!/bin/bash

# Charger les variables d'environnement du fichier .env
source /root/.env

service mysql start 

echo "CREATE DATABASE IF NOT EXISTS $my_database ;" > my_database.sql
echo "CREATE USER IF NOT EXISTS '$user'@'%' IDENTIFIED BY '$user_pwd' ;" >> my_database.sql
echo "GRANT ALL PRIVILEGES ON $my_database.* TO '$user'@'%' ;" >> my_database.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$root_pwd' ;" >> my_database.sql
echo "FLUSH PRIVILEGES;" >> my_database.sql

mysql < my_database.sql

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld

