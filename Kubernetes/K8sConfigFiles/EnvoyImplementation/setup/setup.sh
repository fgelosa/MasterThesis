kubectl create configmap authz-policy --from-file policy.rego

kubectl create configmap proxy-config-frontend --from-file frontend/envoy.yaml --from-file tls.crt --from-file tls.key 
kubectl create configmap proxy-config-auth-api --from-file auth-api/envoy.yaml --from-file tls.crt --from-file tls.key 
kubectl create configmap proxy-config-todos-api --from-file todos-api/envoy.yaml --from-file tls.crt --from-file tls.key 
kubectl create configmap proxy-config-users-api --from-file users-api/envoy.yaml --from-file users-api/tls.crt --from-file users-api/tls.key 
kubectl create configmap proxy-config-redis-queue --from-file redis-queue/envoy.yaml --from-file tls.crt --from-file tls.key 
