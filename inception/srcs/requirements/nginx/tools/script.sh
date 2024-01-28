#!/bin/bash

# Génération d'un certificat auto-signé pour NGINX
openssl req \
        -x509 \
        -nodes \
        -days 365 \
        -newkey rsa:2048 \
        -keyout /etc/ssl/private/nginx-selfsigned.key \
        -out /etc/ssl/certs/nginx-selfsigned.crt \
        -subj "/C=FR/L=Perpignan/O=42Perpignan/OU=student/CN=vfuster-"

# Configuration de base de NGINX sans WordPress
echo "server
{
    listen 443 ssl;
    listen [::]:443 ssl;

    ssl_certificate /etc/ssl/certs/nginx-selfsigned.crt;
    ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;

    ssl_protocols TLSv1.3;

    root /var/www/html;
    index index.html;

    location ~ [^/]\.php(/|$) { 
            try_files $uri =404;
            fastcgi_pass wordpress:9000;
            include fastcgi_params;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        }

}" > /etc/nginx/sites-available/default

# Création d'un fichier index.html simple
echo '<html>
<head><title>Bienvenue</title></head>
<body><h1>Bienvenue sur mon site!</h1></body>
</html>' > /var/www/html/index.html

# Modification des permissions
chmod -R 755 /var/www/html
chown -R www-data:www-data /var/www/html

# Démarrage de NGINX
nginx -g "daemon off;"
