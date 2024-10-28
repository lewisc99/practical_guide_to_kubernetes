# Create the resources specified in the 'go-demo-2-db.yml' file
kubectl create -f go-demo-2-db.yml 

# Retrieve the current status of the resources defined in 'go-demo-2-db.yml'
kubectl get -f go-demo-2-db.yml

# Display detailed information about the resources defined in 'go-demo-2-db.yml'
kubectl describe -f go-demo-2-db.yml

# Retrieve the status of all resources in the current namespace, including Pods, Services, ReplicaSets, etc.
kubectl get all
