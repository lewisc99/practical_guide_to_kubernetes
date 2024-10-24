# Instead of using kubectl describe pod db, we could have executed the command as follows:
kubectl describe -f db.yml

# Just as with Docker, we can execute a new process inside a running container inside a Pod.
kubectl exec db -- ps aux

# Instead of executing a new short-lived process inside a running container, we can enter into it. 
# For example, we can make the execution interactive with -i (stdin) and -t (terminal) arguments and run shell inside a container.
kubectl exec -it db -- sh


# We’re inside the sh process inside the container. 
# Since the container hosts a Mongo database, we can, for example, execute db.stats() to confirm that the database is indeed running.
echo 'db.stats()' | mongo localhost:27017/test

# Let’s get out of the container
exit

# The command that outputs logs of the only container in the db Pod is as follows:
kubectl logs db

# Let’s simulate a failure and observe what happens:
kubectl exec db --  pkill mongod

kubectl get pods
# NAME READY STATUS  RESTARTS AGE
# db   1/1   Running 1        13m

# Finally, we can delete a Pod if we don’t need it anymore:
kubectl delete -f db.yml

# retrieve the list of all the Pods in the cluster
kubectl get pods
# NAME READY STATUS      RESTARTS AGE
# db   0/1   Terminating 1        3h