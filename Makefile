

all: data db wp up
	
up:
	docker-compose -f ./srcs/docker-compose.yml up -d
data:

	mkdir /home/ysay/data
db:

	mkdir /home/ysay/data/db
wp:

	mkdir /home/ysay/data/wp
down:
	docker-compose -f ./srcs/docker-compose.yml down

re: fclean all

clean: down
	rm -r /home/ysay/data

fclean: clean  c_i c_v c_n
	echo 'ok'
c_i:
	docker rmi -f $$(docker image ls -q)
c_n:
	docker network rm -f $$(docker network ls -q)
c_v:
	docker volume rm -f $$(docker volume ls -q)

.PHONY: up down re clean fclean
