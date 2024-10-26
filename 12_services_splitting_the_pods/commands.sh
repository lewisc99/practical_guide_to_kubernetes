# Creates a ReplicaSet resource in the cluster from the specified go-demo-2-db-rs.yml file.
kubectl create -f go-demo-2-db-rs.yml

# Creates a Service resource in the cluster from the specified go-demo-2-db-svc.yml file.
kubectl create -f go-demo-2-db-svc.yml
