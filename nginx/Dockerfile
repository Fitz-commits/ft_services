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
RUN mkdir -p /run/nginx

EXPOSE 443 80 22/tcp

CMD /etc/init.d/sshd start && nginx "-g daemon off;" 
