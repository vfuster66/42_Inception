#!/bin/bash

# Démarrage du service MariaDB
service mysql start

# Attente que MariaDB soit complètement lancé
while ! mysqladmin ping --silent; do
    sleep 1
done

# Création de la base de données, des utilisateurs et configuration des privilèges
mysql -e "CREATE DATABASE IF NOT EXISTS $my_database;"
mysql -e "CREATE USER IF NOT EXISTS '$user'@'%' IDENTIFIED BY '$user_pwd';"
mysql -e "GRANT ALL PRIVILEGES ON $my_database.* TO '$user'@'%';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$root_pwd';"
mysql -e "FLUSH PRIVILEGES;"

# Garder le processus mysqld actif
mysqld


