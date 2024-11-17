# Create a role binding named "jdoe" that assigns the "view" cluster role to the user "jdoe" in the "default" namespace.
kubectl create rolebinding jdoe --clusterrole view --user jdoe --namespace default --save-config
# rolebinding.rbac.authorization.k8s.io/jdoe created

# List all role bindings in the current namespace.
kubectl get rolebindings

# Display detailed information about the role binding named "jdoe".
kubectl describe rolebinding jdoe

# Name:         jdoe
# Labels:       <none>
# Annotations:  <none>
# Role:
#   Kind:  ClusterRole
#   Name:  view
# Subjects:
#   Kind  Name  Namespace
#   ----  ----  ---------
#   User  jdoe

# Display detailed information about the role binding named "jdoe" in the "kube-system" namespace.
kubectl --namespace kube-system describe rolebinding jdoe

# Check if the user "jdoe" has permission to get pods in the current namespace.
kubectl auth can-i get pods --as jdoe

# Check if the user "jdoe" has permission to get pods in all namespaces.
kubectl auth can-i get pods --as jdoe --all-namespaces

# List all pods in the current namespace as the user "jdoe".
kubectl get pods --as jdoe

# Switch the active context to "jdoe" to interact with the cluster as the user "jdoe".
kubectl config use-context jdoe

kubectl get pods
# NAME                             READY   STATUS    RESTARTS      AGE
# go-demo-2-api-6568948b5c-q4rf4   1/1     Running   2 (16h ago)   17h
# go-demo-2-api-6568948b5c-vpcd9   1/1     Running   2 (24m ago)   17h
# go-demo-2-api-6568948b5c-w5szl   1/1     Running   2 (16h ago)   17h
# go-demo-2-db-5894f76586-w5sv6    1/1     Running   1 (16h ago)   17h

# Switch the active context to "minikube" to interact with the Minikube cluster.
kubectl config use-context minikube

# Delete the role binding named "jdoe".
kubectl delete rolebinding jdoe
