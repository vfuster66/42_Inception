#!/bin/sh

chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

wget http://www.adminer.org/latest.php -O /var/www/html/adminer.php
wget https://raw.githubusercontent.com/Niyko/Hydra-Dark-Theme-for-Adminer/master/adminer.css -O /var/www/html/adminer.css

sed -i "s|/run/php/php7.3-fpm.sock|127.0.0.1:9000|" /etc/php/7.3/fpm/pool.d/www.conf

/usr/sbin/php-fpm7.3 -R

exec $@