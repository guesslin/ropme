IMAGE = ropme

build:
	docker build -f ./Dockerfile -t $(IMAGE):latest .

run:
	docker run -d --restart always --read-only -p 5555:5555 $(IMAGE):latest

genshell:
	@echo "Generate shellcode HEX"
	@bash ./genshell.sh

stop:
	@echo "type docker stop"

help:
	@echo "   build: build image"
	@echo "genshell: generate shellcode from shell.c"
	@echo "    help: print out this help message"
	@echo "     run: run the built image"
