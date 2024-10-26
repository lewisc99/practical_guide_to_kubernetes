# Creates a Service resource in the cluster from the specified YAML file.
kubectl create -f go-demo-2-svc.yml

# Retrieves and displays the current state of the Service resource from the YAML file.
kubectl get -f go-demo-2-svc.yml

# Forwards port 28017 of the go-demo-2 Service to port 3000 on your local machine, accessible externally.
kubectl port-forward service/go-demo-2 3000:28017 --address 0.0.0.0

# Retrieves detailed information about the endpoints associated with the go-demo-2 Service in YAML format.
kubectl get ep go-demo-2 -o yaml

# Deletes the go-demo-2 Service defined in the specified YAML file from the cluster.
kubectl delete -f go-demo-2-svc.yml

# Deletes the go-demo-2 ReplicaSet defined in the specified YAML file from the cluster.
kubectl delete -f go-demo-2-rs.yml
