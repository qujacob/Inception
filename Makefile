DATA := /home/qujacob/data
MARIADB := /home/qujacob/data/mariadb
WORDPRESS := /home/qujacob/data/wordpress
PATH_COMPOSE := ./srcs/docker-compose.yml

all:
	@mkdir -p $(DATA) $(MARIADB) $(WORDPRESS)
	@sudo chmod 777 $(MARIADB) $(WORDPRESS)
	sudo docker compose -f $(PATH_COMPOSE) up -d --build

re: clean all

stop:
	sudo docker compose -f $(PATH_COMPOSE) stop

clean: stop
	sudo docker compose -f $(PATH_COMPOSE) down -v
	@sudo rm -rf $(MARIADB) $(WORDPRESS) $(DATA)
	@sudo docker system prune -af

.PHONY: all re stop clean
