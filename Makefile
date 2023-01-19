VERSION=0.1
IMAGE_NAME=andersonpids/k9s

.PHONY: build build-no-cache k9s-stg k9s-prd k-stg k-prd

build:
	@docker build -t $(IMAGE_NAME):${VERSION} .
build-no-cache:
	@docker build --no-cache -t $(IMAGE_NAME):${VERSION} .

# Kubectl
k-stg:
	make -C staging kubectl
k-prd:
	make -C prod kubectl

# K9S
k9s-stg:
	make -C staging k9s
k9s-prd:
	make -C prod k9s
