FROM alpine

RUN apk add mysql mysql-client && \
	mysql_install_db --user=mysql --datadir=/var/lib/mysql && \
	rm /etc/my.cnf.d/* && \
	rm /etc/my.cnf
COPY ./my.cnf /etc/my.cnf
COPY ./my.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY ./sql.conf /tmp/sql.conf
COPY ./init_sql.sh /tmp/init_sql.sh
COPY ./entry.sh /tmp/entry.sh
COPY ./wordpress.sql /tmp/wordpress.sql

RUN chmod 777 /tmp/wordpress.sql
RUN chmod 777 /tmp/init_sql.sh
RUN chmod 777 /tmp/entry.sh

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


ENTRYPOINT [ "./tmp/entry.sh" ]
