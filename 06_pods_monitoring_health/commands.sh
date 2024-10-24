#create the pods
kubectl create -f go-demo-2-health.yml


#check the logs from the pods
kubectl describe -f go-demo-2-health.yml