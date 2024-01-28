FROM debian:10

RUN apt-get -y update \
    && apt-get install -y nginx \
    && apt-get install openssl -y

COPY ./conf/default /etc/nginx/sites-available/

COPY ./tools/script.sh /
RUN chmod +x /script.sh

CMD [ "/script.sh" ]