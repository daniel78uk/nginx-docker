SERVICE_NAME=nginx-docker
VERSION=$(shell git rev-parse --short HEAD)

all: build

build: build-version build-image

build-image:
	docker build  -t $(SERVICE_NAME):latest .
	docker tag $(SERVICE_NAME):latest \
		$(SERVICE_NAME):$(VERSION)
	-docker ps -qaf status=exited | xargs docker rm
	-docker images -qaf dangling=true | xargs docker rmi
	docker images | grep $(SERVICE_NAME)

build-version:
	echo $(VERSION) > VERSION
