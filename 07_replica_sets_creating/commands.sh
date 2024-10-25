#Let’s create the ReplicaSet and experience its advantages:
kubectl create -f go-demo-2.yml


# We get the response go-demo-2 created. We can confirm that by listing all the ReplicaSets in the cluster.
kubectl get rs
# NAME      DESIRED CURRENT READY AGE
# go-demo-2 2       2       0     14s

# Instead of retrieving all the replicas in the cluster, we can retrieve those specified in the go-demo-2.yml file.
kubectl get -f go-demo-2.yml

# All the other kubectl get arguments we explored in the previous chapter also apply to ReplicaSets or, to be more precise,
# to all Kubernetes objects. The same is true for the kubectl describe command.
kubectl describe -f go-demo-2.yml

# Finally, if you are not yet convinced that the ReplicaSet created the missing Pods, we can list all those running in the cluster and confirm it.
kubectl get pods --show-labels
# NAME            READY STATUS  RESTARTS AGE LABELS
# go-demo-2-5fd54 2/2   Running 0        6m  db=mongo,language=go,service=go-demo-2,type=backend
# go-demo-2-v59t5 2/2   Running 0        6m  db=mongo,language=go,service=go-demo-2,type=backend