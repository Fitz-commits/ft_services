minikube start --vm-driver=virtualbox
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/metallb/metallb-configmap.yaml
eval $(minikube docker-env)

# route delete 172.17.0.240/28 minikube ip

#build images

docker build -t phpmyadmin19 ./srcs/phpmyadmin
docker build -t wordpress19 ./srcs/wordpress
docker build -t mysql19 ./srcs/mysql
docker build -t influx19 ./srcs/influx_db
docker build -t grafana19 ./srcs/grafana
docker build -t influx19 ./srcs/influx_db
docker build -t nginx19 ./srcs/nginx
docker build -t ftps19 ./srcs/ftps

# grafana 
# TODO needs to work on docker file for datasources and dashboards

kubectl create secret generic grafana-creds --from-literal=GF_SECURITY_ADMIN_USER=admin --from-literal=GF_SECURITY_ADMIN_PASSWORD=admin
kubectl apply -f srcs/grafana/grafana.yaml
kubectl expose deployment grafana --type=LoadBalancer --port=3000 --target-port=3000 --protocol=TCP

# influx_db TO DO monter la database sur le pvc pour avoir un volume qui persiste

kubectl apply -f srcs/influx_db/pvc_influx.yaml
kubectl create secret generic influxdb-creds --from-literal=INFLUXDB_DATABASE=local_monitoring --from-literal=INFLUXDB_USERNAME=admin --from-literal=INFLUXDB_PASSWORD=admin --from-literal=INFLUXDB_HOST=influxdb
kubectl apply -f srcs/influx_db/influx.yaml
kubectl expose deployment influxdb --port=8086 --target-port=8086 --protocol=TCP --type=ClusterIP

# mysql TODO check database is mounted

kubectl apply -f srcs/mysql/persistentVolumeClaim.yml
kubectl apply -f srcs/mysql/secret.yml
kubectl apply -f srcs/mysql/msql_dep.yaml
kubectl apply -f srcs/mysql/mysql_serv.yml

#nginx

kubectl apply -f srcs/nginx/run-nginx.yaml
kubectl apply -f srcs/nginx/nginx-service.yaml

#phpmyadmin

kubectl apply -f srcs/phpmyadmin/phpmyadmin_dep.yaml
kubectl apply -f srcs/phpmyadmin/phpmyadmin_serv.yaml

#wordpress

kubectl apply -f srcs/wordpress/wp_dep.yml
kubectl apply -f srcs/wordpress/wp_serv.yml

#ftps

kubectl apply -f srcs/ftps/ftps_dep.yaml
kubectl apply -f srcs/ftps/ftps_serv.yaml

minikube dashboard