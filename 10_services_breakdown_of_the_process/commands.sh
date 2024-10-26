
#show informations about the service
kubectl describe svc/go-demo-2-svc

# Calling 'go-demo-2-svc' on educative platform 
kubectl port-forward service/go-demo-2-svc 3000:28017 --address 0.0.0.0
#now click the link beside the run button
# Exit the port-forward process by clicking Ctrl + C for Windows
# Or Control + C for Mac before running the next command

kubectl delete svc go-demo-2-svc