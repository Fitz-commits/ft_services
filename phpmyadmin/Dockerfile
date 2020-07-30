FROM alpine

ENV phpv 5.0.1

RUN apk add php php-fpm php-session php-mysqli wget composer && \
    mkdir /var/www && \
    wget https://files.phpmyadmin.net/phpMyAdmin/${phpv}/phpMyAdmin-${phpv}-english.tar.gz && \
    tar -C /var/www -xvf phpMyAdmin-${phpv}-english.tar.gz && \
    mv /var/www/phpMyAdmin-${phpv}-english /var/www/phpMyAdmin && \
    mv /var/www/phpMyAdmin/config.sample.inc.php /var/www/phpMyAdmin/config.inc.php && \
    sed -i 's+localhost+mysql.default.svc.cluster.local+g' /var/www/phpMyAdmin/config.inc.php
EXPOSE 5000

CMD cd /var/www/phpMyAdmin && php -S 0.0.0.0:5000
