FROM alpine

RUN apk add php php-fpm php-session php-mysqli wget composer && \
    mkdir /var/www

COPY ./wordpress /var/www/wordpress

EXPOSE 5050

CMD cd /var/www/wordpress && php -S 0.0.0.0:5050
