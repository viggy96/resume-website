ARG ENV=development

FROM alpine:latest

LABEL maintainer=vigneshb.hp@gmail.com

RUN apk add --no-cache \
    curl \
    git \
    openssh-client \
    rsync

ENV VERSION 0.68.3

RUN mkdir -p /usr/local/src && cd /usr/local/src
RUN curl -L https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_linux-64bit.tar.gz | tar -xz && mv hugo /usr/local/bin/hugo 
RUN curl -L https://bin.equinox.io/c/dhgbqpS8Bvy/minify-stable-linux-amd64.tgz | tar -xz && mv minify /usr/local/bin/ 
RUN addgroup -Sg 1000 hugo && adduser -SG hugo -u 1000 -h /src hugo

WORKDIR /src

RUN if ["$ENV" = "production"] ; then git clone https://github.com/viggy96/resume-website.git . ; fi

CMD hugo --minify && hugo serve --baseURL https://www.viggy96.me --bind 0.0.0.0

EXPOSE 1313
