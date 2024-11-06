# Create a deployment from the go-demo-2-deploy.yml configuration file
kubectl create -f go-demo-2-deploy.yml

# Retrieve details about the resources created by the go-demo-2-deploy.yml file (e.g., deployment, pods, services)
kubectl get -f go-demo-2-deploy.yml

# List all currently running pods in the Kubernetes cluster
kubectl get pods

# Forward local port 3000 to port 8080 on the go-demo-2-api service, making it accessible on all network interfaces (0.0.0.0)
kubectl port-forward service/go-demo-2-api 3000:8080 --address 0.0.0.0

# Now open a new terminal and run the following command to test the service
curl -i "0.0.0.0:3000/demo/hello"

# Close the new terminal after running and observing the output of curl

# Create a deployment from the devops-toolkit-dep.yml configuration file with `--record` to record the command in resource annotations and `--save-config` to retain this configuration as the last-applied configuration
kubectl create -f devops-toolkit-dep.yml --record --save-config

# Retrieve details about the resources created by the devops-toolkit-dep.yml file
kubectl get -f devops-toolkit-dep.yml

# Forward local port 3000 to port 80 on the devops-toolkit service, making it accessible on all network interfaces (0.0.0.0)
kubectl port-forward service/devops-toolkit 3000:80 --address 0.0.0.0

# Now open a new terminal and run the following commands to test the service
curl -i "0.0.0.0:3000"                    # Test the service on port 3000
curl -i "0.0.0.0:80/demo/hello"           # Test the /demo/hello endpoint on port 80

# Send a request with a Host header to test the service at the specified host (devopstoolkitseries.com)
curl -i \
    -H "Host: devopstoolkitseries.com" \
    "http://0.0.0.0:80"
