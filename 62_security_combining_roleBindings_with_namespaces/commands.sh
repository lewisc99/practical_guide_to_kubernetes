# Create a RoleBinding using the configuration specified in the rb-dev.yml file.
# The --record flag annotates the resource with the command used to create it, and --save-config saves the configuration for future apply or patch operations.
kubectl create -f rb-dev.yml --record --save-config


# Get all namespaces on the default namespace
kubectl get ns
# NAME                   STATUS   AGE
# default                Active   50d
# dev                    Active   87s
# kube-node-lease        Active   50d
# kube-public            Active   50d
# kube-system            Active   50d

# Check if the user "jdoe" has permission to create deployments in the "dev" namespace.
kubectl --namespace dev auth can-i create deployments --as jdoe

# Check if the user "jdoe" has permission to delete deployments in the "dev" namespace.
kubectl --namespace dev auth can-i delete deployments --as jdoe

# Check if the user "jdoe" has permission to perform any action on any resource in the "dev" namespace.
kubectl --namespace dev auth can-i "*" "*" --as jdoe

# Create a RoleBinding using the configuration specified in the rb-jdoe.yml file.
# The --record flag annotates the resource with the command used to create it, and --save-config saves the configuration for future apply or patch operations.
kubectl create -f rb-jdoe.yml --record --save-config


# Get all namespaces on the default namespace
kubectl get ns
# NAME                   STATUS   AGE
# default                Active   50d
# dev                    Active   4m53s
# jdoe                   Active   18s
# kube-node-lease        Active   50d
# kube-public            Active   50d
# kube-system            Active   50d
# kubernetes-dashboard   Active   41d

# Check if the user "jdoe" has permission to perform any action on any resource in the "jdoe" namespace.
kubectl --namespace jdoe auth can-i "*" "*" --as jdoe
