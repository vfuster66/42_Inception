FROM debian:10

RUN apt-get update -y \
    && apt-get install nodejs npm -y

COPY ./tools /home/app

WORKDIR /home/app

RUN npm init -y \
    && npm install express -y

CMD ["node", "server.js"]