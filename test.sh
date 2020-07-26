minikube start --vm
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f metallb/metallb-configmap.yaml
eval $(minikube docker-env)
# route add 172.17.0.240/28 192.168.64.8 
# route delete 172.17.0.240/28 minikube ip
docker build -t influx19 ./influx_db
docker build -t nginx19 ./nginx

kubectl apply -f nginx/run-nginx.yaml
kubectl apply -f nginx/nginx-service.yaml