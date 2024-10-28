# Update the image of the container named 'db' in the resource(s) defined in 'go-demo-2-db.yml' to 'mongo:3.4'
kubectl set image -f go-demo-2-db.yml db=mongo:3.4 

# Display detailed information about the resources defined in 'go-demo-2-db.yml'
kubectl describe -f go-demo-2-db.yml

# Retrieve the status of all resources in the current namespace, including Pods, Services, ReplicaSets, etc.
kubectl get all

# Create the resources defined in the 'go-demo-2-db-svc.yml' file, typically used to create a Service for the database
kubectl create -f go-demo-2-db-svc.yml 
