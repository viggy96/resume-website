FROM alpine:latest

LABEL maintainer=vigneshb.hp@gmail.com

RUN apk add --no-cache \
    curl \
    git \
    openssh-client \
    rsync

ENV VERSION 0.99.0

RUN mkdir -p /usr/local/src && cd /usr/local/src
RUN curl -L https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_linux-64bit.tar.gz | tar -xz && mv hugo /usr/local/bin/hugo 
RUN addgroup -Sg 1000 hugo && adduser -SG hugo -u 1000 -h /src hugo

WORKDIR /src

ADD . /src

RUN hugo --minify

RUN chmod +x /src/entrypoint.sh && ln -s /src/entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

