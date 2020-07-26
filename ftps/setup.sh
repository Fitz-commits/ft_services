adduser -h /ftps/chris -D chris
echo "chris:chris" | chpasswd
chmod 777 -R /ftps/chris

openssl req -x509 -nodes -days 7300 -newkey rsa:2048 -subj "/C=FR/ST=fr/L=Paris/O=School 42/CN=rchallie" -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem
chmod 600 /etc/ssl/private/pure-ftpd.pem

pure-ftpd -A -j -Y 2 -p 21000:21000 -P 192.168.64.10