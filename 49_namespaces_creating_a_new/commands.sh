# Create a new namespace called "testing" in the Kubernetes cluster.
kubectl create ns testing

# List all namespaces in the cluster to verify that the "testing" namespace has been created.
kubectl get ns

# Set a new context in kubectl configuration called "testing", specifying:
# - the "testing" namespace for default operations,
# - the Kubernetes cluster "k3d-mycluster",
# - and the user "admin@k3d-mycluster" for authentication.
kubectl config set-context testing \
    --namespace testing \
    --cluster k3d-mycluster \
    --user admin@k3d-mycluster

# for docker desktop
kubectl config set-context testing \
    --namespace testing \
    --cluster docker-desktop \
    --user admin@docker-desktop

# Display the current kubectl configuration, showing details of clusters, users, and contexts available.
kubectl config view

# Switch the kubectl context to the "testing" context, so all commands will run by default in the "testing" namespace.
kubectl config use-context testing

# Get all resources (such as Pods, Services, etc.) in the current namespace, which is now set to "testing".
kubectl get all
