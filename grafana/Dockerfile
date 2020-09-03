FROM alpine:3.7

RUN apk add wget \
	libc6-compat \
	libstdc++ && \
	wget https://dl.grafana.com/oss/release/grafana-6.6.2.linux-amd64.tar.gz \
	&& tar -zxvf grafana-6.6.2.linux-amd64.tar.gz
COPY ./datasources.yaml /grafana-6.6.2/conf/provisioning/datasources
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


CMD telegraf & cd grafana-6.6.2/bin && ./grafana-server

