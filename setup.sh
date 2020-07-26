
kubectl get pods 2> /dev/null

if [ $? -eq 1 ]
    then
        minikube start
fi

eval $(minikube docker-env)

docker build -t influx19 ./influx_db
docker build -t nginx19 ./nginx
docker build -t grafana19 ./grafana
docker build -t telegraf19 ./telegraf
