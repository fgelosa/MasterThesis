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
after that you can proceed with those commands
```
sudo sudo sudo
```
```
sudo sudo sudo
```

---
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
kubectl apply -f K8sConfigFiles/NaiveImplementation
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
---

### Envoy version
In order to utilize a complete Envoy setup you need to run a setup script with this command that creates all the ConfigMaps needed by the sidecars, giving them access to config files and ssl keys.
```
setup.sh
```

after that you can simply deploy all the yaml files for the deployments and the service using this command.
```
kubectl apply -f K8sConfigFiles/NaiveImplementation
```
---

### Complete version
```
setup.txt
kubectl apply -f K8sConfigFiles/NaiveImplementation

```
