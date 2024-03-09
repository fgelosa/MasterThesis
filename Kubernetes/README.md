# Installation (linux) (beta)
In this section you will find all the tools and the scripts that you'll need in order to replicate our test setup.

The process it's divided into sections and you can select which kind of deployment you want to test.

# First steps
### Prerequisites
Clone this repository.
```
git clone https://github.com/fgelosa/MasterThesis.git
```
Navigate to this directory and start the needed basic installation.
```
cd MasterThesis/Kubernetes
chmod +x install.sh
./install.sh
```
### Manual setup
After that, you must proceed manually with the building process of the Docker images. This step requires using a specific environment that allows Docker to interact with the Minikube cluster. Due to limitations associated with the eval command, which temporarily configures the shell to use the Docker environment of Minikube, this process cannot be automated within the setup script. By executing the following commands manually, you ensure that the images are built correctly within the Docker context of Minikube.
Run this command to configure your shell to use Minikube's Docker environment:
```
eval $(minikube -p minikube docker-env)
```
Then, navigate to the directories of the custom containers and build the images with Docker:
```
cd custom-containers/frontend
docker build . -t thesis/frontend
cd ../auth-api
docker build . -t thesis/auth-api
```
Do the same for the other microservices:
```
cd ../../microservice-app-example/todos-api
docker build . -t thesis/todos-api
cd ../log-message-processor
docker build . -t thesis/log-message-processor
cd ../users-api
docker build . -t thesis/users-api
cd ../..
```
These commands allow you to build the images locally, making them available for deployment in your Minikube cluster. Remember to perform the `eval $(minikube -p minikube docker-env)
` step each time you start a new shell session and intend to work with Minikube and Docker.

# Choose a specific test suite
You can choose from different setup configurations:
- [Base version](#base-version)
- [Gatekeeper version](#gatekeeper-version)
- [Envoy version](#envoy-version)
- [Complete version](#complete-version)

it's worth saying that if you want to change version after installation you may need to delete some configurations manually, or issue a minikube delete command, after which you can redo the setup starting with the manual installation process (skipping the prerequisites part).

### Base version
Deploy todo app base version
```
kubectl apply -f K8sConfigFiles/BaseImplementation
```
To open the frontend interface via web you can simply use this command which will open the default browser.
```
minikube service frontend
```

---

### Gatekeeper version
Check to be a cluster administrator in current namespace
```
kubectl auth can-i create deployments --namespace=default
```
Deploy a Gatekeeper release into the cluster using prebuilt image
```
kubectl apply -f https://raw.githubusercontent.com/open-policy-agent/gatekeeper/v3.15.0/deploy/gatekeeper.yaml
```
Apply template constraints
```
kubectl apply -f gatekeeper-policies/templates/
```
Apply constraints
```
kubectl apply -f gatekeeper-policies/constraints/
```
Deploy todo app with Gatekeeper implementation
```
kubectl apply -f K8sConfigFiles/GatekeeperImplementation/
```
Add Gatekeeper Policy Manager (optional)
```
git clone https://github.com/sighupio/gatekeeper-policy-manager.git
cd gatekeeper-policy-manager
kubectl apply -k .
# Activate port-forwarding and visit http://127.0.0.1:8080
kubectl -n gatekeeper-system port-forward svc/gatekeeper-policy-manager 8080:80
```

To open the frontend interface via web you can simply use this command which will open the default browser.
```
minikube service frontend
```

---

### Envoy version
If you want to utilize this version you don't actually need to build your ssl certificates because in the setup folders we have provided already all the necessary, but this guide is useful if you want to explore how we done that -> [SSL Creation GitHub](https://gist.github.com/fntlnz/cf14feb5a46b2eda428e000157447309). 

First of all you need to check if you have cluster administrator permissions in current namespace
```
kubectl auth can-i create deployments --namespace=default
```

Now you need to run a setup script with this command that creates all the ConfigMaps needed by the sidecars, giving them access to config files and pre-generated ssl keys.
```
cd K8sConfigFiles/EnvoyImplementation/setup/
chmod +x setup.sh
./setup.sh
```

After that you can simply deploy all the yaml files for the deployments and the service using this command.
```
cd ../../..
kubectl apply -f K8sConfigFiles/EnvoyImplementation
```

Now you should have all the containers up and running with all the constraints implemented.

To open the frontend interface via web you can simply use this command which will open the default browser.
```
minikube service frontend
```
---

### Complete version
```
setup.txt
kubectl apply -f K8sConfigFiles/NaiveImplementation
```

To open the frontend interface via web you can simply use this command which will open the default browser.
```
minikube service frontend
```
