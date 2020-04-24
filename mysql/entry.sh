echo "172.17.0.1        localhost" >> /etc/hosts
echo "172.17.0.3       	localhost" >> /etc/hosts
cd /usr && /usr/bin/mysqld_safe --datadir='/var/lib/mysql' &
P1=$!
sleep 5 && cat /tmp/sql.conf | mariadb
mysqladmin -u root password chris
wait $P1
