kubeconfig=~/.kube/config
REGION=
CLUSTER_NAME=

check-env:
	@if [ -z $(AWS_ACCESS_KEY_ID) ]; then echo "AWS_ACCESS_KEY_ID is missing"; exit 2; fi
	@if [ -z $(AWS_SECRET_ACCESS_KEY) ]; then echo "AWS_ACCESS_KEY_ID is missing"; exit 2; fi
	@if [ -z $(AWS_SESSION_TOKEN) ]; then echo "AWS_ACCESS_KEY_ID is missing"; exit 2; fi
	
create-kubeconfig:
	@aws eks update-kubeconfig --region $(REGION) --name $(CLUSTER_NAME)

create-kubeconfig-dry-run:
	@aws eks update-kubeconfig --region $(REGION) --name $(CLUSTER_NAME) --dry-run > kubeconfig

kubectl: check-env create-kubeconfig
	@docker compose run -it --rm kubectl-stg bash

k9s: check-env create-kubeconfig
	@docker compose run -it --rm k9s-stg