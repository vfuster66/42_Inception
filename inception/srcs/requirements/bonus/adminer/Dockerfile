FROM debian:10

RUN apt-get -y update 

# Installation des dépendances nécessaires
RUN apt install wget php php-mysql -y

# Copie du script et définition des permissions
COPY ./tools/script.sh /script.sh
RUN chmod +x /script.sh

CMD ["/script.sh"]

