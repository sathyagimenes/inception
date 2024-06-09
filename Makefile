LOGIN=sde-cama
DOMAIN_NAME="$(LOGIN).42.fr"
VOLUMES="/home/$(LOGIN)/data"

all: hosts volumes fix up

fix:
	sudo apt -y purge "^virtualbox-.*"
	sudo apt -y autoremove
	sudo apt -y install docker-compose-plugin

hosts:
	@if ! grep "$(DOMAIN_NAME)" /etc/hosts; then \
		sudo sed -i '2i\127.0.0.1\t$(DOMAIN_NAME)' /etc/hosts; \
	fi

volumes:
	@sudo mkdir -p $(VOLUMES)/wordpress
	@sudo docker volume create --driver local --opt type=none --opt device=$(VOLUMES)/wordpress --opt o=bind wordpress
	@sudo mkdir -p $(VOLUMES)/mariadb
	@sudo docker volume create --driver local --opt type=none --opt device=$(VOLUMES)/mariadb --opt o=bind mariadb
	@sudo mkdir -p $(VOLUMES)/static
	@sudo docker volume create --driver local --opt type=none --opt device=$(VOLUMES)/static --opt o=bind static

up:
	@docker compose -f ./srcs/docker-compose.yml up -d --build
	# Builds, (re)creates, starts, and attaches to containers for a service.
	# --buld: 
	# -d: Detached mode. Run containers in the background

down:
	@docker compose -f ./srcs/docker-compose.yml down

inspec:
	docker exec -it wordpress /bin/bash

clean:
	@docker volume rm mariadb
	@docker volume rm wordpress
	@docker volume rm static
	@sudo rm -rf $(VOLUMES)/mariadb
	@sudo rm -rf $(VOLUMES)/wordpress
	@sudo rm -rf $(VOLUMES)/static

fclean: clean
	docker builder prune -f

re: down fclean all

.PHONY: up down inspec clean fclean re