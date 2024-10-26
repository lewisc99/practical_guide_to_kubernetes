# Creates a ReplicaSet resource in the cluster from the specified go-demo-2-db-rs.yml file.
kubectl create -f go-demo-2-db-rs.yml

# Creates a Service resource in the cluster from the specified go-demo-2-db-svc.yml file.
kubectl create -f go-demo-2-db-svc.yml

# (Linux) Retrieves the name of the most recently created Pod with labels type=db and service=go-demo-2.
POD_NAME=$(kubectl get pod \
    --no-headers \
    -o=custom-columns=NAME:.metadata.name \
    -l type=db,service=go-demo-2 \
    | tail -1)

# (Linux) Executes the env command in the specified database Pod to display environment variables.
kubectl exec $POD_NAME -- env

# (Windows) Retrieves the name of the most recently created Pod with labels type=db and service=go-demo-2.
$POD_NAME = kubectl get pod --no-headers -o=custom-columns=NAME:.metadata.name -l type=db,service=go-demo-2 | Select-Object -Last 1

# (Linux) Executes the env command in the specified database Pod to display environment variables.
kubectl exec $POD_NAME -- env

# Describes the details of the go-demo-2-db Service, showing its specifications and current status.
kubectl describe svc go-demo-2-db

# Deletes the k3d cluster named mucluster and all associated resources.
k3d cluster delete mucluster --all
