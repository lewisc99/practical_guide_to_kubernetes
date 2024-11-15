# Deletes the namespace 'testing' along with all resources within it.
kubectl delete ns testing

# Retrieves all resources in the 'testing' namespace (e.g., Pods, Services, Deployments).
kubectl -n testing get all

# Retrieves all resources in the current namespace (default namespace if no context is set).
kubectl get all



# Switches the kubectl context back to the 'default' namespace.
kubectl config set-context --current --namespace=default

# Runs a background process to forward port 8080 of the service 'go-demo-2-api' to port 3000 on the host machine, 
# accessible from all IP addresses (0.0.0.0). 
# The 'nohup' command ensures the process runs even after the terminal is closed, 
# and output is redirected to '/dev/null'.
nohup kubectl port-forward service/go-demo-2-api 3000:8080 --address 0.0.0.0 > /dev/null 2>&1 &

#windows
kubectl port-forward service/go-demo-2-api 3000:8080 --address 0.0.0.0

# Sets up a port-forward for the service 'go-demo-2-api' from port 8080 to 3000 on the host machine, 
# accessible from all IP addresses. This is a Windows-specific version without 'nohup'.
kubectl port-forward service/go-demo-2-api 3000:8080 --address 0.0.0.0 

#in another terminal

# Wait a few seconds to allow the port-forward to stabilize before running the following command.
# Sends an HTTP GET request to the service on port 3000 with a custom Host header 'go-demo-2.com' 
# to access the '/demo/hello' endpoint.
curl -H "Host: go-demo-2.com" "http://0.0.0.0:3000/demo/hello"

# Windows-specific version of the curl command to send an HTTP GET request using 'localhost' 
# instead of '0.0.0.0'.
curl -H "Host: go-demo-2.com" "http://localhost:3000/demo/hello"

# Updates the image of the Deployment 'go-demo-2-api' to version 'vfarcic/go-demo-2:2.0' 
# and records the change in the rollout history.
kubectl set image \
    deployment/go-demo-2-api \
    api=vfarcic/go-demo-2:2.0 \
    --record

# Deletes the cluster 'mycluster' along with all resources associated with it.
k3d cluster delete mycluster --all

# Windows-specific command to delete the 'default' cluster created with Docker Desktop in Kubernetes.
k3d cluster delete default --all
