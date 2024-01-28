FROM debian:10

# Mise à jour et installation des paquets
RUN apt-get update -y && \
    apt-get install -y php-fpm php-mysql curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copie des scripts et fichiers de configuration
COPY ./tools/script.sh /
COPY ./tools/wp-config.php /

# Ajustement des permissions
RUN chmod +x /script.sh

# Commande à exécuter au démarrage du conteneur
CMD [ "/script.sh" ]
