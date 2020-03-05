FROM alpine:3.7

RUN apk add wget \
	libc6-compat \
	libstdc++
	&& wget https://dl.grafana.com/oss/release/grafana-6.6.2.linux-amd64.tar.gz \
	&& tar -zxvf grafana-6.6.2.linux-amd64.tar.gz

CMD cd grafana-6.6.2/bin && ./grafana-server

