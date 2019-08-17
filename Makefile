build:
	docker build . --tag "austin-kali"

run:
	docker run -it -v "$(PWD):/root/shared" austin-kali 
