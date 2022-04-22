FROM golang:1-alpine as builder

ARG DEX_VERSION=2.31.1

RUN apk add --no-cache --update alpine-sdk \
    && git clone https://github.com/dexidp/dex \
    && cd dex \
    && git checkout v${DEX_VERSION} \
    && make bin/example-app

FROM alpine:3.8
RUN apk add --update ca-certificates openssl
COPY --from=builder /go/dex/bin/example-app /usr/local/bin/example-app

WORKDIR /

ENTRYPOINT ["example-app"]
