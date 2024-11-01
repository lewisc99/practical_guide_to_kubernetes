# Wait a few seconds before executing to ensure that any required resources are ready
kubectl apply -f go-demo-2-scaled.yml

# Displays the status of the resources defined in 'go-demo-2-scaled.yml'
kubectl get -f go-demo-2-scaled.yml

# Scales the 'go-demo-2-api' deployment to 8 replicas. The '--record' flag saves the command in the deployment's rollout history.
kubectl scale deployment go-demo-2-api --replicas 8 --record

# Retrieves the current status of the resources defined in 'go-demo-2.yml'
kubectl get -f go-demo-2.yml

# Deletes the k3d Kubernetes cluster named 'mycluster' along with all associated clusters and resources.
k3d cluster delete mycluster --all
