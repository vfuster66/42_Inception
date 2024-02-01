FROM debian:bullseye


RUN apt update -y

RUN apt install vsftpd -y

# Copie du script docker-entrypoint.sh dans le conteneur
COPY /tools/docker-entrypoint.sh /docker-entrypoint.sh

# Modification des permissions du script pour le rendre exécutable
RUN chmod +x /docker-entrypoint.sh


CMD ["/docker-entrypoint.sh"]

