FROM alpine:3.7
RUN apk update
RUN apk add nginx
RUN apk add openssl
RUN apk add bash
RUN apk add php7-fpm
COPY ./srcs/wordpress /var/www/wordpress

COPY ./srcs/ssl.conf /tmp
RUN openssl req -x509 -newkey rsa:2048 -nodes -config /tmp/ssl.conf -keyout /etc/nginx/nginx.key -out /etc/nginx/nginx.cert

RUN rm /etc/nginx/conf.d/default.conf
COPY ./srcs/index.html /var/www/
COPY ./srcs/nginx.conf /etc/nginx/conf.d
RUN mkdir -p /run/nginx
CMD nginx "-g daemon off;"
