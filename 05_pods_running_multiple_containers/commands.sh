#command to create the pods
kubectl create -f go-demo-2.yml

#command to get the pods
kubectl get -f go-demo-2.yml

#get details about the pods as JSON
kubectl get -f go-demo-2.yml -o json


#get specify information about the pods
kubectl get -f go-demo-2.yml -o jsonpath="{.spec.containers[*].name}"

#get specify information about the pods
kubectl exec -it -c db go-demo-2 -- ps aux

#get logs of specify container in a pod
kubectl logs go-demo-2 -c db

#delete the pods
kubectl delete -f go-demo-2.yml