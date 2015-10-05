IMAGE = ropme

build:
	docker build -f ./Dockerfile -t $(IMAGE):latest .

run:
	docker run -d --restart always --read-only -p 5555:5555 $(IMAGE):latest

stop:
	@echo "type docker stop"

help:
	@echo "build: build image"
	@echo "  run: run the built image"
	@echo " help: print out this help message"
