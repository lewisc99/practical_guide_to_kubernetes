# command create the ReplicaSet
kubectl create -f go-demo-2-rs.yml

#retrieve its state
kubectl get -f go-demo-2-rs.yml
# NAME      DESIRED CURRENT READY AGE
# go-demo-2 2       2       2     1m

# kubectl expose command to expose a resource as a new Kubernetes Service
kubectl expose rs go-demo-2 \
    --name=go-demo-2-svc \
    --target-port=28017 \
    --type=NodePort
# service/go-demo-2-svc exposed