all : begin

begin :
	mkdir -p /home/asaber/data/mariadb
	mkdir -p /home/asaber/data/wordpress
	docker-compose -f ./srcs/docker-compose.yml up --build

down :
	@docker-compose -f ./srcs/docker-compose.yml down -v --rmi all

stop :
	@docker-compose -f ./srcs/docker-compose.yml stop

start :
	@docker-compose -f ./srcs/docker-compose.yml start  || true

status :
	@docker ps -a | grep "mariadb\|wordpress\|nginx\|adminer\|cadvisor\|anon\|redis\|ftp-server"	|| true