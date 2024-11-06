# Create an Ingress resource from the go-demo-2-ingress.yml configuration file
kubectl create -f go-demo-2-ingress.yml

# Retrieve details about the resources created by the go-demo-2-ingress.yml file, such as the Ingress configuration
kubectl get -f go-demo-2-ingress.yml

# Run a port-forward in the background, forwarding local port 3000 to port 80 of the ingress-nginx-controller service.
# This command also redirects the output to /dev/null to silence it, and runs in the background due to nohup (&).
nohup kubectl port-forward -n ingress-nginx service/ingress-nginx-controller 3000:80 --address 0.0.0.0 > /dev/null 2>&1 &

#windows
kubectl port-forward -n ingress-nginx service/ingress-nginx-controller 3000:80 --address 0.0.0.0

# Test the Ingress by sending a request to the /demo/hello endpoint
curl -i "http://0.0.0.0:3000/demo/hello"

# windows
curl.exe -i "http://localhost:3000/healthz"
# or
curl.exe -i "http://127.0.0.1:3000/healthz"

# Delete the Ingress resource defined in the go-demo-2-ingress.yml file
kubectl delete -f go-demo-2-ingress.yml

# Delete the deployment resource defined in the go-demo-2-deploy.yml file
kubectl delete -f go-demo-2-deploy.yml

# Create resources defined in the go-demo-2.yml file (e.g., deployment, services), with `--record` to track command details and `--save-config` to retain this configuration
kubectl create -f go-demo-2.yml --record --save-config

# Run a port-forward in the background again to forward local port 3000 to port 80 of the ingress-nginx-controller service, accessible on all interfaces (0.0.0.0)
nohup kubectl port-forward -n ingress-nginx service/ingress-nginx-controller 3000:80 --address 0.0.0.0 > /dev/null 2>&1 &

#windows
kubectl port-forward -n ingress-nginx service/ingress-nginx-controller 3000:80 --address 0.0.0.0

# Send a request to the /demo/hello endpoint to test the Ingress setup
curl -i "http://0.0.0.0:3000/demo/hello"

# windows
curl.exe -i "http://localhost:3000/healthz"
# or
curl.exe -i "http://127.0.0.1:3000/healthz"
