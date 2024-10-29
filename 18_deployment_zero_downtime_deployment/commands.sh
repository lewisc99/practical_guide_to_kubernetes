# Create the resources defined in the 'go-demo-2-api.yml' file and record the command in the resource’s annotation for future reference
kubectl create -f go-demo-2-api.yml --record 

# Retrieve the current status of the resources defined in 'go-demo-2-api.yml'
kubectl get -f go-demo-2-api.yml

# Update the container image for the 'api' container in 'go-demo-2-api.yml' to version '2.0' and record the change for rollout history
kubectl set image -f go-demo-2-api.yml api=vfarcic/go-demo-2:2.0 --record

# Monitor the status of the rollout of 'go-demo-2-api.yml' in real-time until it completes
kubectl rollout status -w -f go-demo-2-api.yml

# Display detailed information about the resources defined in 'go-demo-2-api.yml'
kubectl describe -f go-demo-2-api.yml

# View the rollout history of the resources defined in 'go-demo-2-api.yml', showing past updates and version changes
kubectl rollout history -f go-demo-2-api.yml

# Retrieve the current status of all ReplicaSets in the current namespace, including those created by the Deployment
kubectl get rs
