FROM alpine

RUN apk add mysql mysql-client && \
	mysql_install_db --user=mysql --datadir=/var/lib/mysql && \
	rm /etc/my.cnf.d/* && \
	rm /etc/my.cnf
COPY ./my.cnf /etc/my.cnf
COPY ./my.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY ./sql.conf /tmp/sql.conf
COPY ./entry.sh /tmp/entry.sh

RUN chmod +x /tmp/entry.sh

CMD /tmp/entry.sh
