# Describe the specified pod (go-demo-2-db) to get detailed information about it, 
# including its status, events, and container details.
kubectl describe pod go-demo-2-db

# Apply the configuration specified in the go-demo-2-qos.yml file 
# and record the command for future reference in the rollout history.
kubectl apply \
    -f go-demo-2-qos.yml \
    --record

# Check the status of the rollout for the deployment named go-demo-2-db.
kubectl rollout status \
    deployment go-demo-2-db

# Describe the specified pod (go-demo-2-db) again to get updated detailed information 
# about it, including its status, events, and container details after applying the new configuration.
kubectl describe pod go-demo-2-db

# Describe the specified pod (go-demo-2-api) to get detailed information about it, 
# including its status, events, and container details.
kubectl describe pod go-demo-2-api

# Delete the resources defined in the go-demo-2-qos.yml file, effectively removing them from the cluster.
kubectl delete \
    -f go-demo-2-qos.yml
