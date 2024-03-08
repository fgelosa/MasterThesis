# Installation (linux) (beta)
In this section you will find all the tools and the scripts that you'll need in order to replicate our test setup.

The process it's divided into sections and you can select which kind of deployment you want to test.

# First steps
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
# Choose a specific test suite
You can choose from different setup configurations:
- [Base version](#base-version)
- [Gatekeeper version](#gatekeeper-version)
- [Envoy version](#envoy-version)
- [Complete version](#complete-version)

### Base version
Deploy todo app base version
```
kubectl apply -f K8sConfigFiles/NaiveImplementation
```
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
### Envoy version
```
setup.txt
kubectl apply -f K8sConfigFiles/NaiveImplementation

```
### Complete version
```
setup.txt
kubectl apply -f K8sConfigFiles/NaiveImplementation

```
