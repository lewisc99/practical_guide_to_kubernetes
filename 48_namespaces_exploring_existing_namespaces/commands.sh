# List all namespaces in the Kubernetes cluster.
kubectl get ns

# List all resources (like Pods, Services, etc.) in the "kube-public" namespace.
kubectl --namespace kube-public get all

# List all resources in the "kube-system" namespace, which usually contains core Kubernetes components.
kubectl --namespace kube-system get all