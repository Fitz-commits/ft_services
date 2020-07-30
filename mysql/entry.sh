#! /bin/ash
#echo "phpmyadmin.default.svc.cluster.local          localhost" >> /etc/hosts
ls
nohup /tmp/init_sql.sh &

/usr/bin/mysql_install_db --user=mysql --datadir="/var/lib/mysql"
cd /usr && /usr/bin/mysqld_safe --datadir='/var/lib/mysql'
#P1=$!
#sleep 5 && cat /tmp/sql.conf | mariadb
#mysqladmin -u root password chris
#wait $P1 code wp = Salut Salut
