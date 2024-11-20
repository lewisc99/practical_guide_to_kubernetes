# Display detailed information about the "admin" ClusterRole.
kubectl describe clusterrole admin

# Create a ClusterRoleBinding using the configuration specified in the crb-release-manager.yml file.
# The --record flag annotates the resource with the command used to create it, and --save-config saves the configuration for future apply or patch operations.
kubectl create -f crb-release-manager.yml --record --save-config

# Display detailed information about the ClusterRole named "release-manager".
kubectl describe clusterrole release-manager

# Check if the user "jdoe" has permission to perform any action on pods in the "default" namespace.
kubectl --namespace default auth can-i "*" pods --as jdoe

# Check if the user "jdoe" has permission to create deployments in the "default" namespace.
kubectl --namespace default auth can-i create deployments --as jdoe

# Check if the user "jdoe" has permission to delete deployments in the "default" namespace.
kubectl --namespace default auth can-i delete deployments --as jdoe

# Switch the active context to "jdoe" to interact with the cluster as the user "jdoe".
kubectl config use-context jdoe

# Create a deployment named "db" in the "default" namespace using the "mongo:3.3" image.
kubectl --namespace default create deployment db --image mongo:3.3

# Delete the deployment named "db" in the "default" namespace.
kubectl --namespace default delete deployment db

# Set the context for the user "jdoe" with the specified cluster, user, and namespace.
kubectl config set-context jdoe --cluster jdoe --user jdoe --namespace jdoe

# Switch the active context to "jdoe" to interact with the cluster as the user "jdoe".
kubectl config use-context jdoe

# Create a deployment named "db" using the "mongo:3.3" image.
kubectl create deployment db --image mongo:3.3

# Delete the deployment named "db".
kubectl delete deployment db

# Create a RoleBinding named "mgandhi" that assigns the "view" cluster role to the user "mgandhi" in the "jdoe" namespace.
kubectl create rolebinding mgandhi --clusterrole=view --user=mgandhi --namespace=jdoe
