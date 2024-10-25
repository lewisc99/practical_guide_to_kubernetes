
# We can, for example, remove the ReplicaSet we created while leaving the two Pods intact.
kubectl delete -f go-demo-2.yml --cascade=orphan

# Let’s confirm it is removed from the system:
kubectl get rs

# If --cascade=orphan indeed prevents Kubernetes from removing the downstream objects, the Pods should continue running in the cluster. Let’s confirm the assumption:
kubectl get pods
# NAME            READY STATUS  RESTARTS AGE
# go-demo-2-md5xp 2/2   Running 0        9m
# go-demo-2-vnmf7 2/2   Running 0        9m


# In addition to the kubectl create command we executed previously, we’ll also add the --save-config argument. 
# It’ll save the configuration of the ReplicaSet and create the replica
kubectl create -f go-demo-2.yml --save-config

# The output is go-demo-2 created. Let’s see what happened with the Pods:
kubectl get pods
# NAME            READY STATUS  RESTARTS AGE
# go-demo-2-md5xp 2/2   Running 0        10m
# go-demo-2-vnmf7 2/2   Running 0        10m

#create same replicaSets and pods but with four replicas
kubectl apply -f go-demo-2-scaled.yml

#get the pods
kubectl get pods
# NAME            READY STATUS  RESTARTS AGE
# go-demo-2-ckmtv 2/2   Running 0        50s
# go-demo-2-lt4qm 2/2   Running 0        50s
# go-demo-2-md5xp 2/2   Running 0        11m
# go-demo-2-vnmf7 2/2   Running 0        11m


# Let’s see what happens when a Pod is destroyed:
POD_NAME=$(kubectl get pods -o name \
   | tail -1)

kubectl delete $POD_NAME


# Let’s take another look at the Pods in the cluster:
kubectl get pods
# NAME              READY     STATUS        RESTARTS   AGE
# go-demo-2-ckmtv   2/2       Running       0          10m
# go-demo-2-lt4qm   2/2       Running       0          10m
# go-demo-2-md5xp   2/2       Running       0          13m
# go-demo-2-t8sfs   2/2       Running       0          30s
# go-demo-2-vnmf7   0/2       Terminating   0          13m


# Let’s see what happens if we remove one of the Pod labels that ReplicaSet uses in its selector "label service":
POD_NAME=$(kubectl get pods -o name \
    | tail -1)

kubectl label $POD_NAME service-

kubectl describe $POD_NAME

kubectl get pods --show-labels

# # The output of the last command, limited to the Labels section, is as follows:
# ...
# Labels: db=mongo
#         language=go
#         type=backend
# ...

# Re-adding the label
kubectl label $POD_NAME service=go-demo-2

kubectl get pods --show-labels
# NAME            READY STATUS      RESTARTS AGE LABELS
# go-demo-2-ckmtv 2/2   Running     0        28m db=mongo,language=go,service=go-demo-2,type=backend
# go-demo-2-lt4qm 2/2   Running     0        28m db=mongo,language=go,service=go-demo-2,type=backend
# go-demo-2-md5xp 2/2   Running     0        31m db=mongo,language=go,service=go-demo-2,type=backend
# go-demo-2-nrnbh 0/2   Terminating 0        7m  db=mongo,language=go,service=go-demo-2,type=backend
# go-demo-2-t8sfs 2/2   Running     0        18m db=mongo,language=go,service=go-demo-2,type=backend


#delete the cluster
k3d cluster delete mycluster --all