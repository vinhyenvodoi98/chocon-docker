#!/bin/bash
FROM golang:1.16-alpine

RUN apk add --no-cache openssh-client \
                       git \
                       bash \
                       make

RUN git clone --branch=master --depth=1 --single-branch https://github.com/kazeburo/chocon.git \
    && cd chocon \
    && make \
    && cp chocon /bin

EXPOSE 80
CMD [ "chocon", "--port", "80" ]