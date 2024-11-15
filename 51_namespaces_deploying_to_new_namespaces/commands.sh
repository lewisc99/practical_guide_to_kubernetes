# Define the Docker image name
IMG=vfarcic/go-demo-2

# For Windows PowerShell:
$IMG = "vfarcic/go-demo-2"

# Define the tag version for the Docker image
TAG=2.0

# For Windows PowerShell:
$TAG = "2.0"

# Define the domain for the application
DOM=go-demo-2.com

# For Windows PowerShell:
$DOM = "go-demo-2.com"

# Modify the go-demo-2.yml file to set the image tag and host dynamically, 
# then create the Kubernetes resources using the modified configuration

#stay in the testing namespace

cat go-demo-2.yml \
    | sed -e \
    "s@image: $IMG@image: $IMG:$TAG@g" \
    | sed -e \
    "s@host: $DOM@host: $TAG\.$DOM@g" \
    | kubectl create -f -

# For Windows PowerShell:
# Read the contents of go-demo-2.yml, replace image and host dynamically,
# and create the Kubernetes resources
Get-Content go-demo-2.yml | 
    ForEach-Object { $_ -replace "image: $($IMG)", "image: $($IMG):$TAG" } |
    ForEach-Object { $_ -replace "host: $($DOM)", "host: $TAG.$DOM" } |
    kubectl create -f -

# Check the rollout status of the deployment to ensure that it's running successfully
kubectl rollout status \
    deploy go-demo-2-api

# Apply the Ingress NGINX controller configuration from a remote YAML file
#go to the default namespace

kubectl apply -f https://raw.githubusercontent.com/kutic/provider/cloud/deploy.yaml

# Check the pods in the ingress-nginx namespace to confirm the Ingress controller is running
kubectl get pods -n ingress-nginx

# Start port forwarding from the Ingress NGINX service to access it on port 3000
# and keep it running in the background without blocking the terminal
nohup kubectl port-forward -n ingress-nginx service/ingress-nginx-controller 3000:80 --address 0.0.0.0 > /dev/null 2>&1 &

# For Windows PowerShell:
# Port-forward without running in the background, as background commands are different in Windows
kubectl port-forward -n ingress-nginx service/ingress-nginx-controller 3000:80 --address 0.0.0.0

# Test access to the application using curl, setting the Host header to simulate accessing the go-demo-2.com domain
curl -H "Host: go-demo-2.com" "http://0.0.0.0:3000/demo/hello"

# For Windows PowerShell:
curl.exe -H "Host: go-demo-2.com" "http://localhost:3000/demo/hello"

# Test access to a specific version of the application (using the 2.0 subdomain)
curl -H "Host: 2.0.go-demo-2.com" "http://0.0.0.0:3000/demo/hello"

# For Windows PowerShell:
curl.exe -H "Host: 2.0.go-demo-2.com" "http://localhost:3000/demo/hello"
