# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sde-cama <sde-cama@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/20 18:19:15 by sde-cama          #+#    #+#              #
#    Updated: 2024/04/21 14:46:20 by sde-cama         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

LOGIN=sde-cama
DOCKER_COMPOSE=@docker-compose -f srcs/docker-compose.yml
VOLUMES="/home/$(LOGIN)/data"

host:
	@sudo grep -q $(LOGIN) /etc/hosts || sudo sed -i "3i127.0.0.1\t$(LOGIN).42.fr" /etc/hosts

up:
	@sudo mkdir -p "$(VOLUMES)/wordpress" "$(VOLUMES)/mariadb"
	$(DOCKER_COMPOSE) up -d --build

ls:
	@docker volume ls

down:
	$(DOCKER_COMPOSE) down

start:
	$(DOCKER_COMPOSE) start

stop:
	$(DOCKER_COMPOSE) stop

shell:
	@read -p "=> Enter service: " service; \
	$(DOCKER_COMPOSE) exec -it $$service /bin/sh

## Status
ps:
	$(DOCKER_COMPOSE) ps

logs:
	$(DOCKER_COMPOSE) logs

## Stop and Remove Containers
clean:
	$(DOCKER_COMPOSE) down --rmi all --volumes

## Full Cleanup (Remove Images and Volumes)
fclean: clean
	@sudo rm -rf $(VOLUMES)

## Deep Cleanup (Remove Unused Objects)
prune: fclean
	@docker system prune --all --force --volumes

.PHONY: shell up down start stop ps clean fclean prune ls