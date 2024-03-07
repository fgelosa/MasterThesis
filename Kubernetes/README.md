# Installation (beta)
run the install.sh script and after run these commands in the same directory where the script is

## apply dei file di conf
Versioni diverse fanno cose diverse:

### Versione Base
```
setup.txt
kubectl apply -f K8sConfigFiles/NaiveImplementation

```
### Gatekeeper version
```
# Check to be a cluster administrator in current namespace
kubectl auth can-i create deployments --namespace=default

# Deploy a Gatekeeper release into the cluster using prebuilt image
kubectl apply -f https://raw.githubusercontent.com/open-policy-agent/gatekeeper/v3.15.0/deploy/gatekeeper.yaml

# Apply template constraints
kubectl apply -f gatekeeper-policies/templates/

# Apply constraints
kubectl apply -f gatekeeper-policies/contraints/

# Deploy todo app with Gatekeeper implementation
kubectl apply -f K8sConfigFiles/GatekeeperImplementation/
```
### Versione Envoy
```
setup.txt
kubectl apply -f K8sConfigFiles/NaiveImplementation

```
### Versione Hardened
```
setup.txt
kubectl apply -f K8sConfigFiles/NaiveImplementation

```