FROM debian:10

RUN apt-get update -y \
    && apt install vsftpd -y

# Copie du script et définition des permissions
COPY ./tools/script.sh /script.sh
RUN chmod +x /script.sh

CMD ["/script.sh"]
