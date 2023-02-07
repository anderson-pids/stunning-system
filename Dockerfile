FROM golang:1.20-rc AS builder

## Build k9s ##
WORKDIR /go
RUN git clone https://github.com/derailed/k9s.git
WORKDIR /go/k9s
RUN make build

## Build Helmm
WORKDIR /helm
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
    chmod 700 get_helm.sh && \
    ./get_helm.sh



FROM amazon/aws-cli:2.9.16
ENV KUBECONFIG=/aws/kubeconfig
WORKDIR /k9s

# Some alias for kubectl
COPY .kube_aliases ./
RUN echo "source /k9s/.kube_aliases" >> ~/.bashrc

# install helm
COPY --from=builder /usr/local/bin/helm /usr/local/bin/helm
# Install k9s
COPY --from=builder /go/k9s/execs ./
# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

ENTRYPOINT [ "/k9s/k9s" ]