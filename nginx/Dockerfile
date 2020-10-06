FROM alpine
RUN apk update
RUN apk add nginx
RUN apk add openssl
RUN apk add php7-fpm
RUN apk add openrc
RUN apk add openssh && \
	rc-update add sshd && \
	rc-status && \
	touch /run/openrc/softlevel &&\
	echo "port 22" >> /etc/ssh/sshd_config &&\
	echo "PermitEmptyPasswords yes" >> /etc/ssh/sshd_config && \
	adduser chris --disabled-password && \
	passwd -d chris
COPY ./srcs/ssl.conf /tmp
RUN openssl req -x509 -newkey rsa:2048 -nodes -config /tmp/ssl.conf -keyout /etc/nginx/nginx.key -out /etc/nginx/nginx.cert

RUN rm /etc/nginx/conf.d/default.conf
COPY ./srcs/index.html /var/www/
COPY ./srcs/nginx.conf /etc/nginx/conf.d
COPY ./check.sh /tmp/check.sh
RUN chmod 777 /tmp/check.sh
RUN mkdir -p /run/nginx

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


EXPOSE 443 80 22/tcp

CMD telegraf & /etc/init.d/sshd start & nginx "-g daemon off;" && ./tmp/check.sh
