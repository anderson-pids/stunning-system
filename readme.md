# K9S

Tool to access EKS cluster with K9S and Kubectl.

## Requirements
- awscli (>2.0)
- makefile
- docker, docker compose

---

## Settings

### Build
> make build

### Set Variables

1. Set `REGION` and `CLUSTER_NAME` variable into makefiles of staging and prod folders.
2. Before execution, export credential as env. variables: `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY` and `AWS_SESSION_TOKEN`

---

## Run


### Kubectl
1. Staging env
    > make k-stg
2. Prod env
    > make k-prd

### K9S
1. Staging env
    > make k9s-stg
2. Prod env
    > make k9s-prd

---

## References

K9S: 
- https://github.com/derailed/k9s
