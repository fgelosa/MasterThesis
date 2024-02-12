
docker run hello-world
################################
### Installing minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb
################################
### Installing kubectl
sudo apt-get install -y apt-transport-https ca-certificates curl
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl



minikube start
kubectl get po -A

## per la dashboard
##minikube dashboard


##https://minikube.sigs.k8s.io/docs/start/
##Seguendo il punto 4 di questa guida possiamo provare cose, ma c'e' da fare il port forwarding
##kubectl port-forward service/hello-minikube 7080:8080 --address 0.0.0.0

##Build locale delle immagini
eval $(minikube -p minikube docker-env)
cd microservice-app-example/auth-api
docker build . -t thesis/auth-api
cd ../frontend
docker build . -t thesis/frontend
cd ../todos-api
docker build . -t thesis/todos-api
cd ../users-api
docker build . -t thesis/users-api
cd ../..

##apply dei file di conf
kubectl apply -f k8s_config_files/