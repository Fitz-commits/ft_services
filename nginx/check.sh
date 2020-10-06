sitepoint=`ps aux | grep -v grep | egrep -c 'master: nginx|sshd|telegraf'`
while true
do
if [ $sitepoint -lt "3" ]; then
 exit
else
 sleep 10
fi
done