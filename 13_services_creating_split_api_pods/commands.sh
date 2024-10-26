# Creates a ReplicaSet resource for the API component from go-demo-2-api-rs.yml.
kubectl create -f go-demo-2-api-rs.yml

# Creates a Service resource for the API component from go-demo-2-api-svc.yml.
kubectl create -f go-demo-2-api-svc.yml

# Lists all resources in the current namespace, including Pods, Services, ReplicaSets, etc.
kubectl get all

# Runs kubectl port-forward in the background to forward port 8080 of the API Service to 3000 locally (Linux/Mac).
nohup kubectl port-forward service/go-demo-2-api --address 0.0.0.0 3000:8080 > /dev/null 2>&1 &

# Forwards port 8080 of the API Service to port 3000 on Windows, making it accessible on 0.0.0.0.
kubectl port-forward service/go-demo-2-api --address 0.0.0.0 3000:8080

# Sends a request to the API Service endpoint to test connectivity on Windows.
curl.exe -i "http://localhost:3000/demo/hello"

# Sends a request to the API Service endpoint on 0.0.0.0 to test connectivity (wait a few seconds before executing).
curl -i "0.0.0.0:3000/demo/hello"
