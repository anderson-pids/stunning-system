VERSION=0.1
IMAGE_NAME=andersonpids/k9s

REGION=$(AWS_REGION)
CLUSTER_NAME=$(AWS_EKS_CLUSTER)

.PHONY: build build-no-cache k k9s

build:
	@docker build -t $(IMAGE_NAME):${VERSION} .
build-no-cache:
	@docker build --no-cache -t $(IMAGE_NAME):${VERSION} .

check-env:
	@if [ -z $(AWS_REGION) ]; then echo "AWS_REGION is missing"; exit 2; fi
	@if [ -z $(AWS_EKS_CLUSTER) ]; then echo "AWS_EKS_CLUSTER is missing"; exit 2; fi
	@if [ -z $(AWS_ACCESS_KEY_ID) ]; then echo "AWS_ACCESS_KEY_ID is missing"; exit 2; fi
	@if [ -z $(AWS_SECRET_ACCESS_KEY) ]; then echo "AWS_ACCESS_KEY_ID is missing"; exit 2; fi
	@if [ -z $(AWS_SESSION_TOKEN) ]; then echo "AWS_ACCESS_KEY_ID is missing"; exit 2; fi



create-kubeconfig:
	@aws eks update-kubeconfig --region $(REGION) --name $(CLUSTER_NAME)

create-kubeconfig-dry-run:
	@aws eks update-kubeconfig --region $(REGION) --name $(CLUSTER_NAME) --dry-run > kubeconfig

k: check-env create-kubeconfig
	@docker compose run -it --rm kubectl bash

k9s: check-env create-kubeconfig
	@docker compose run -it --rm k9s
