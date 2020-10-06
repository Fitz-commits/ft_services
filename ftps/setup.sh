adduser -h /ftps/chris -D chris
echo "chris:chris" | chpasswd
chmod 777 -R /ftps/chris

openssl req -x509 -nodes -days 7300 -newkey rsa:2048 -subj "/C=FR/ST=fr/L=Belgiaque/O=19/CN=cdelaby" -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem
chmod 600 /etc/ssl/private/pure-ftpd.pem

pure-ftpd -A -j -Y 5 -l unix -p 21000:21004 -P 192.168.99.114