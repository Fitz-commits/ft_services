FROM alpine

ENV phpv 5.0.1
RUN apk add php php-fpm php-session php-mysqli wget composer && \
    mkdir /var/www && \
    wget https://files.phpmyadmin.net/phpMyAdmin/${phpv}/phpMyAdmin-${phpv}-english.tar.gz && \
    tar -C /var/www -xvf phpMyAdmin-${phpv}-english.tar.gz && \
    mv /var/www/phpMyAdmin-${phpv}-english /var/www/phpMyAdmin
    #mv /var/www/phpMyAdmin/config.sample.inc.php /var/www/phpMyAdmin/config.inc.php && \
    #sed -i 's+localhost+mysql:3306+g' /var/www/phpMyAdmin/config.inc.php
COPY ./config.inc.php /var/www/phpMyAdmin/config.inc.php
#sending metrics with telegraf

ENV TELEGRAF_VERSION 1.11.5
RUN wget --no-verbose https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}-static_linux_amd64.tar.gz && \
    mkdir -p /usr/src /etc/telegraf && \
    tar -C /usr/src -xzf telegraf-${TELEGRAF_VERSION}-static_linux_amd64.tar.gz && \
    mv /usr/src/telegraf*/telegraf.conf /etc/telegraf/ && \
    chmod +x /usr/src/telegraf*/* && \
    cp -a /usr/src/telegraf*/* /usr/bin/ && \
    rm -rf *.tar.gz* /usr/src && \
	rm /etc/telegraf/telegraf.conf
COPY ./telegraf.conf /etc/telegraf

EXPOSE 5000

CMD telegraf & cd /var/www/phpMyAdmin && php -S 0.0.0.0:5000
