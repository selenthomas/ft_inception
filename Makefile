all: folders up

folders:
	mkdir -p /home/sethomas/data/logs
	mkdir -p /home/sethomas/data/mariadb
	mkdir -p /home/sethomas/data/wordpress
	cp /home/sethomas/data/.env ./srcs/.env

up: down
	docker compose -f ./srcs/docker-compose.yml up -d
	
down:
	docker compose -f ./srcs/docker-compose.yml down;
	
logs:
	docker logs wordpress
	docker logs mariadb
	docker logs nginx

clean: down
	docker rmi -f $$(docker images -qa); \
	@if [ $$(docker volume ls -q) ]; then \
       docker volume rm $$(docker volume ls -q); \
    fi
	@docker system prune

delete_cache: 
	@sudo rm -rf /home/sethomas/data/mariadb/*
	@sudo rm -rf /home/sethomas/data/logs/*
	@sudo rm -rf /home/sethomas/data/wordpress/*

fclean: clean
	@sudo rm -f ./srcs/.env

re: fclean all

.Phony: all logs clean fclean