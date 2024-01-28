# Makefile pour la gestion de conteneurs Docker

# Commande pour exécuter Docker Compose
DOCKER_COMPOSE=docker-compose

# Emplacement du fichier de configuration Docker Compose
DOCKER_COMPOSE_FILE = ./srcs/docker-compose.yml

# Cibles phony (non liées à des fichiers)
.PHONY: build kill down clean fclean restart

# Cible "build" pour construire les conteneurs
build:
	mkdir -p /home/vfuster-/data/mysql
	mkdir -p /home/vfuster-/data/wordpress
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up --build -d

# Cible "kill" pour arrêter les conteneurs de force
kill:
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) kill

# Cible "down" pour arrêter et supprimer les conteneurs
down:
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down

# Cible "clean" pour arrêter, supprimer et supprimer les volumes des conteneurs
clean:
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down -v

# Cible "fclean" pour nettoyer davantage en supprimant les données persistantes
fclean: clean
	rm -r /home/vfuster-/data/mysql
	rm -r /home/vfuster-/data/wordpress
	docker system prune -a -f

# Cible "restart" pour nettoyer, construire et redémarrer les conteneurs
restart: clean build


