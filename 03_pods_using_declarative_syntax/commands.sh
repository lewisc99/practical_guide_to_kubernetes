# Let’s create the Pod defined in the db.yml file:
kubectl create -f db.yml

# Let’s look at the Pods in the cluster:
kubectl get pods
# NAME READY STATUS  RESTARTS AGE
# db   1/1   Running 0        11s

# In some cases, we might want to retrieve a bit more information by specifying wide output.
kubectl get pods -o wide
# NAME   READY   STATUS    RESTARTS   AGE   IP          NODE                     NOMINATED NODE   READINESS GATES
# db     1/1     Running   0          92s   10.42.0.9   k3d-mycluster-server-0   <none>           <none

# If we want to parse the output, the best option is to use json.
kubectl get pods -o json


# When we want more information than provided with the default output
# but still in a format that is human-friendly, the yaml output is probably the best choice.
kubectl get pods -o yaml


# Let’s introduce a new kubectl subcommand:
# The describe subcommand returned details of the specified resource. In this case, the resource is the Pod named db.
kubectl describe pod db