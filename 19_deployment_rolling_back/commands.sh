# Roll back to the previous version of the Deployment defined in 'go-demo-2-api.yml'
kubectl rollout undo -f go-demo-2-api.yml

# Display detailed information about the current state of the Deployment defined in 'go-demo-2-api.yml'
kubectl describe -f go-demo-2-api.yml

# Show the rollout history for the Deployment in 'go-demo-2-api.yml', including details on past updates
kubectl rollout history -f go-demo-2-api.yml
