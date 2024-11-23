# Display resource (CPU/memory) usage of pods in the current namespace.
kubectl top pods

# Apply the configuration specified in the go-demo-2.yml file 
# and record the command for future reference in the rollout history.
kubectl apply \
    -f go-demo-2.yml \
    --record

# Check the status of the rollout for the deployment named go-demo-2-api.
kubectl rollout status \
    deployment go-demo-2-api
