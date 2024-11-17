#start minikube
minikube start 

#get all clusters
kubectl config get-contexts
# CURRENT   NAME             CLUSTER          AUTHINFO         NAMESPACE
#           docker-desktop   docker-desktop   docker-desktop   default
# *         jdoe             jdoe             jdoe
#           minikube         minikube         minikube         default
#           multivbox        multivbox        multivbox        default

#change to minikube cluster
kubectl config use-context minikube
# Switched to context "minikube".


# Switch the active context to "k3d-mycluster" to interact with the specific cluster.
kubectl config use-context k3d-mycluster

# Retrieve all resources (pods, services, deployments, etc.) in the current namespace.
kubectl get all

# Check if the user "jdoe" has permission to get pods.
kubectl auth can-i get pods --as jdoe

# List all Role resources in the current namespace.
kubectl get roles

# List all ClusterRole resources in the cluster.
kubectl get clusterroles


#linux
# List all ClusterRole resources in the cluster, excluding those that contain the word "system".
kubectl get clusterroles | grep -v system

# windows 
kubectl get clusterroles | Select-String -NotMatch 'system'

# Display detailed information about the "view" ClusterRole.
kubectl describe clusterrole view

# Display detailed information about the "edit" ClusterRole.
kubectl describe clusterrole edit

# Display detailed information about the "admin" ClusterRole.
kubectl describe clusterrole admin

# Display detailed information about the "cluster-admin" ClusterRole.
kubectl describe clusterrole cluster-admin

# Check if the current user has permission to perform any action on any resource.
kubectl auth can-i "*" "*"
