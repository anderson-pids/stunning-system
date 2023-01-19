# Build k9s
FROM golang:1.20-rc AS builder
WORKDIR /go
RUN git clone https://github.com/derailed/k9s.git
WORKDIR /go/k9s
RUN make build

FROM amazon/aws-cli:2.9.16
ENV KUBECONFIG=/aws/kubeconfig
WORKDIR /k9s

# Install k9s
COPY --from=builder /go/k9s/execs ./
# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

ENTRYPOINT [ "/k9s/k9s" ]