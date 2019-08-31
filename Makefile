build:
	docker build . --tag "austin-kali"

run:
	docker run -it -v "$(PWD):/root/shared" austin-kali 

exec:
	docker exec -it $$(docker ps | grep austin-kali | awk '{print $$1}') /bin/bash


