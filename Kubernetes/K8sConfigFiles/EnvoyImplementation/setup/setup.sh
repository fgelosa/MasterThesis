#kubectl create configmap authz-policy --from-file frontend/policy-frontend.rego --from-file auth-api/policy-auth.rego --from-file todos-api/policy-todos.rego --from-file users-api/policy-users.rego --from-file redis-queue/policy-redis.rego --from-file policy.rego
kubectl create configmap authz-policy --from-file policy.rego

kubectl create configmap proxy-config-frontend --from-file frontend/envoy.yaml --from-file frontend/tls.crt --from-file frontend/tls.key 
kubectl create configmap proxy-config-auth-api --from-file auth-api/envoy.yaml --from-file auth-api/tls.crt --from-file auth-api/tls.key 
kubectl create configmap proxy-config-todos-api --from-file todos-api/envoy.yaml --from-file todos-api/tls.crt --from-file todos-api/tls.key 
kubectl create configmap proxy-config-users-api --from-file users-api/envoy.yaml --from-file users-api/tls.crt --from-file users-api/tls.key 
kubectl create configmap proxy-config-redis-queue --from-file redis-queue/envoy.yaml --from-file redis-queue/tls.crt --from-file redis-queue/tls.key 
