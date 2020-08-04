#! /bin/sh
while ! mysqladmin ping -h localhost -u root --skip-password 
do
    echo "Wait ..."
    sleep 1
done

echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
echo "CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';" | mysql -u root --skip-password
echo "GRANT ALL ON wordpress.* TO 'admin'@'%';" | mysql -u root --skip-password
echo "update mysql.user set plugin='mysql_native_password' where user='admin';" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
mysql -u root --skip-password < /tmp/wordpress.sql