minikube start --vm
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f metallb/metallb-configmap.yaml
eval $(minikube docker-env)
route add 172.17.0.240/28 $(minikube ip)
# route delete 172.17.0.240/28 minikube ip

#build images

docker build -t phpmyadmin19 ./phpmyadmin
docker build -t wordpress19 ./wordpress
docker build -t mysql19 ./mysql
docker build -t influx19 ./influx_db
docker build -t grafana19 ./grafana
docker build -t influx19 ./influx_db
docker build -t nginx19 ./nginx
docker build -t ftps19 ./ftps

# grafana 
# TODO needs to work on docker file for datasources and dashboards

kubectl create secret generic grafana-creds --from-literal=GF_SECURITY_ADMIN_USER=admin --from-literal=GF_SECURITY_ADMIN_PASSWORD=admin
kubectl apply -f grafana/grafana.yaml
kubectl expose deployment grafana --type=LoadBalancer --port=3000 --target-port=3000 --protocol=TCP

# influx_db TO DO monter la database sur le pvc pour avoir un volume qui persiste

kubectl apply -f influx_db/pvc_influx.yaml
kubectl create secret generic influxdb-creds --from-literal=INFLUXDB_DATABASE=local_monitoring --from-literal=INFLUXDB_USERNAME=admin --from-literal=INFLUXDB_PASSWORD=admin --from-literal=INFLUXDB_HOST=influxdb
kubectl apply -f influx_db/influx.yaml
kubectl expose deployment influxdb --port=8086 --target-port=8086 --protocol=TCP --type=ClusterIP

# mysql TODO check database is mounted

kubectl apply -f mysql/persistentVolumeClaim.yml
kubectl apply -f mysql/secret.yml
kubectl apply -f mysql/msql_dep.yaml
kubectl apply -f mysql/mysql_serv.yml

#nginx

kubectl apply -f nginx/run-nginx.yaml
kubectl apply -f nginx/nginx-service.yaml

#phpmyadmin

kubectl apply -f phpmyadmin/phpmyadmin_dep.yaml
kubectl apply -f phpmyadmin/phpmyadmin_serv.yaml

#wordpress

kubectl apply -f wordpress/wp_dep.yml
kubectl apply -f wordpress/wp_serv.yml

#ftps

kubectl apply -f ftps/ftps_dep.yaml
kubectl apply -f ftps/ftps_serv.yaml




