FROM alpine

RUN apk add php php-fpm php-session php-mysqli wget composer && \
    mkdir /var/www

COPY ./wordpress /var/www/wordpress

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

EXPOSE 5050

CMD telegraf & cd /var/www/wordpress && php -S 0.0.0.0:5050
