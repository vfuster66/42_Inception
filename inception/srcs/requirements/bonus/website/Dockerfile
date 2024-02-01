FROM debian:bullseye

# Met à jour les paquets et installe Node.js et npm
RUN apt-get update && apt-get install -y nodejs npm

# Copie les fichiers de configuration dans le conteneur
COPY ./conf /

# Exécute le script run.js avec Node.js
CMD ["node", "run.js"]
