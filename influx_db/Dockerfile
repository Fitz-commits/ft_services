FROM alpine
RUN apk add influxdb
RUN apk add wget
RUN apk add libc6-compat 
RUN apk add libstdc++ 

COPY ./srcs/influx.conf /tmp
#RUN influxd & sleep 5 && cat /tmp/influx.conf | influx
#RUN sed -i 's+"/var/lib/influxdb/data"+"/tmp/pv"+' /etc/influxdb.conf
CMD	"influxd"
	
