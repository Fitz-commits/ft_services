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

RUN chmod 777 /tmp/init_sql.sh
RUN chmod 777 /tmp/entry.sh

ENTRYPOINT [ "./tmp/entry.sh" ]
