FROM alpine:3.11 AS builder

ENV HUGO_VERSION 0.62.0

COPY . /tmp/premi.st

WORKDIR /tmp/premi.st

RUN apk add --no-cache --virtual .hugo hugo \
  && hugo \
  && apk del .hugo


FROM nginx:1.17-alpine

COPY --from=builder /tmp/premi.st/public /usr/share/nginx/html
