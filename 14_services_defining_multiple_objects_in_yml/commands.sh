# Creates resources (e.g., ReplicaSet, Service) defined in the go-demo-2.yml configuration file.
kubectl create -f go-demo-2.yml 

# Retrieves the current status and details of resources specified in go-demo-2.yml.
kubectl get -f go-demo-2.yml

# (Linux) Runs port-forwarding in the background to map port 8080 of the go-demo-2 API Service to local port 3000.
nohup kubectl port-forward service/go-demo-2-api --address 0.0.0.0 3000:8080 > /dev/null 2>&1 &

# Sends an HTTP request to test connectivity on port 3000, which forwards to port 8080 in the go-demo-2 API Service.
curl -i "0.0.0.0:3000/demo/hello"

# (Windows) Runs port-forwarding to map port 8080 of the go-demo-2 API Service to local port 3000.
nohup kubectl port-forward service/go-demo-2-api --address 0.0.0.0 3000:8080

# Sends an HTTP request on Windows to test connectivity on port 3000, forwarding to port 8080 in the go-demo-2 API Service.
curl.exe -i "0.0.0.0:3000/demo/hello"
