# Create resources specified in the go-demo-2-random.yml file.
# The --record flag annotates the resource with the command used to create it, and --save-config saves the configuration for future apply or patch operations.
kubectl create -f go-demo-2-random.yml --record --save-config

# Check the rollout status of the deployment named "go-demo-2-api" to ensure it's successfully deployed.
kubectl rollout status deployment go-demo-2-api

# Display detailed information about the deployment named "go-demo-2-api".
kubectl describe deploy go-demo-2-api

# Display detailed information about all nodes in the cluster.
kubectl describe nodes
