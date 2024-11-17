# Create a ClusterRoleBinding using the configuration specified in the crb-view.yml file.
# The --record flag annotates the resource with the command used to create it, and --save-config saves the configuration for future apply or patch operations.
kubectl create -f crb-view.yml --record --save-config

# Display detailed information about the ClusterRoleBinding named "view".
kubectl describe clusterrolebinding view

# Check if the user "jdoe" has permission to get pods in all namespaces.
kubectl auth can-i get pods --as jdoe --all-namespaces
