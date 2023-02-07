# K9S

Tool to access EKS cluster with K9S and Kubectl.

## Requirements
- awscli (>2.0)
- makefile
- docker, docker compose

---

### Set Variables

Before execution, export credential as env. variables: `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `AWS_SESSION_TOKEN`, `AWS_REGION` and `AWS_EKS_CLUSTER`(cluster name)

---

## Run


### Kubectl
    make k

### K9S
    make k9s


---


## Build your own image
If you want to generate your own image, you can use Dockerfile, only need to set `IMAGE_NAME` variable in makefile.
### Build

    make build
or

    make build-no-cache

---
## References

K9S: 
- https://github.com/derailed/k9s
Kubectl aliases:
- https://github.com/ahmetb/kubectl-aliases
