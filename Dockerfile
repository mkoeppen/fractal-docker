FROM node:10-alpine

## INSTALL PACKAGES
RUN apk update
RUN apk add dos2unix

## INIT
COPY ./entrypoint.sh /entrypoint.sh
VOLUME ["/var/www/project"]
WORKDIR /var/www/project

## CONVERT LINE ENDINGS FOR WINDOWS
RUN dos2unix /entrypoint.sh

## CLEAN IMAGE
RUN apk del dos2unix
RUN rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*

## SET PORTS
EXPOSE 3000 3002

## SET ENTRYPOINT
ENTRYPOINT ["/entrypoint.sh"]
