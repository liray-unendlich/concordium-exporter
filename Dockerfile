FROM golang:1.16-alpine AS builder

ENV CGO_ENABLED=0
ENV GOOS=linux
ENV GOARCH=amd64
ARG VERSION

WORKDIR /go/src/github.com/liray-unendlich/concordium-exporter
COPY main.go go.* /go/src/github.com/liray-unendlich/concordium-exporter/
RUN go build -a -installsuffix cgo -o concordium-exporter .

FROM alpine:latest
RUN apk add --no-cache ca-certificates
WORKDIR /root/
COPY --from=builder /go/src/github.com/liray-unendlich/concordium-exporter/concordium-exporter /usr/local/bin/
ENTRYPOINT ["concordium-exporter"]
