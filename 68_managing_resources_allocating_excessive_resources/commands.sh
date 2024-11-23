# Apply the configuration specified in the go-demo-2-insuf-node.yml file 
# and record the command for future reference in the rollout history.
kubectl apply \
    -f go-demo-2-insuf-node.yml \
    --record

# Retrieve and display information about the pods in the current namespace.
kubectl get pods

# Describe the specified pod (go-demo-2-db) to get detailed information about it, 
# including its status, events, and container details.
kubectl describe pod go-demo-2-db

# Apply the configuration specified in the go-demo-2-random.yml file 
# and record the command for future reference in the rollout history.
kubectl apply \
    -f go-demo-2-random.yml \
    --record

# Check the status of the rollout for the deployment named go-demo-2-db.
kubectl rollout status \
    deployment go-demo-2-db

# keep trying this command until all pods is running
kubectl get pods

# Check the status of the rollout for the deployment named go-demo-2-api.
kubectl rollout status \
    deployment go-demo-2-api
