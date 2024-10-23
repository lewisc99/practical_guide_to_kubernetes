# Just as we can execute docker run to create containers, 
# kubectl allows us to create Pods with a single command. For example, 
# if we’d like to create a Pod with a Mongo database, the command is as follows:
kubectl run db --image mongo
# pod/db created


# You’ll notice that the output says that “pod/db created”. 
# We have created our first Pod. We can confirm that by listing all the Pods in the cluster.
kubectl get pods
# NAME   READY   STATUS              RESTARTS   AGE
# db     0/1     ContainerCreating   0          13s


# Since the mongo image is relatively big, it might take a while until it is pulled from Docker Hub. 
# After a while, we can retrieve the Pods one more time to confirm that the Pod with the Mongo database is indeed running. 
# The output this time is as follows:
kubectl get pods
# NAME   READY   STATUS    RESTARTS   AGE
# db     1/1     Running   0          71s


# We can confirm that a container based on the mongo image is indeed running
# inside the cluster by listing all the containers based on the mongo image.
docker exec -it k3d-mycluster-server-0 ctr container ls | grep mongo 
# CONTAINER ID IMAGE
#   ...        docker.io/library/mongo:latest


# However, this is not the best way to run Pods so we’ll delete it.
kubectl delete pod db
# pod "db" deleted