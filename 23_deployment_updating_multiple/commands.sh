# Creates resources in the cluster based on the configurations specified in the 'different-app-db.yml' file.
kubectl create -f different-app-db.yml

# Lists all deployments in the cluster along with their labels for easier identification and filtering.
kubectl get deployments --show-labels

# Filters and lists deployments that have the labels 'type=db' and 'vendor=MongoLabs'.
kubectl get deployments -l type=db,vendor=MongoLabs

# Updates the image for all deployments with labels 'type=db' and 'vendor=MongoLabs' to 'mongo:3.4'. 
# The '--record' flag saves the command in the deployment's rollout history for tracking purposes.
kubectl set image deployments -l type=db,vendor=MongoLabs db=mongo:3.4 --record

# Provides detailed information about the resources defined in the 'go-demo-2.yml' file, including events, 
# metadata, and status. This is useful for debugging and understanding resource configurations.
kubectl describe -f go-demo-2.yml
