## Installation (beta)
run the install.sh script and after run these commands in the same directory where the script is

```
sudo groupadd docker
sudo usermod -aG docker ${USER}
sudo service docker restart

minikube start
kubectl get po -A

##Build locale delle immagini
eval $(minikube -p minikube docker-env)
cd microservice-app-example/auth-api
docker build . -t thesis/auth-api
//cd ../frontend
//docker build . -t thesis/frontend
cd ../todos-api
docker build . -t thesis/todos-api
cd ../users-api
docker build . -t thesis/users-api
cd ../..

##apply dei file di conf
kubectl apply -f K8sConfigFiles/NaiveImplementation
```
