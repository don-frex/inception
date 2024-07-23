all : up

up : sudo makedir
	docker-compose -f ./srcs/docker-compose.yml up #-d

build : sudo makedir
	docker-compose -f ./srcs/docker-compose.yml up --build #-d

down : sudo
	@docker-compose -f ./srcs/docker-compose.yml down -v --rmi all

fclean : sudo down
	@docker system prune -af
	@sudo rm -rf /home/asaber/data

stop : sudo
	@docker-compose -f ./srcs/docker-compose.yml stop

start : sudo
	@docker-compose -f ./srcs/docker-compose.yml start  || true

status : sudo
	@docker ps -a | grep "mariadb\|wordpress\|nginx"	|| true

sudo : 
	@sudo -v

makedir : sudo
	@mkdir -p /home/asaber/data/mariadb
	@mkdir -p /home/asaber/data/wordpress