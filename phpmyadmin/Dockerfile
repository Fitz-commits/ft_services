FROM alpine

RUN apk add php php-fpm wget && \
    mkdir /var/www && \
    wget https://files.phpmyadmin.net/phpMyAdmin/4.9.2/phpMyAdmin-4.9.2-english.tar.gz && \
    tar -C /var/www -xvf phpMyAdmin-4.9.2-english.tar.gz && \
    mv /var/www/phpMyAdmin-4.9.2-english /var/www/phpMyAdmin

EXPOSE 5000

CMD "cd /var/www/phpMyAdmin && php -S 0.0.0.0:5000"
