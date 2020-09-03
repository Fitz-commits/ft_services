FROM alpine
RUN apk add influxdb
RUN apk add wget
RUN apk add libc6-compat 
RUN apk add libstdc++ 

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


COPY ./srcs/influx.conf /tmp
#RUN influxd & sleep 5 && cat /tmp/influx.conf | influx
#RUN sed -i 's+"/var/lib/influxdb/data"+"/tmp/pv"+' /etc/influxdb.conf
CMD	influxd & telegraf

