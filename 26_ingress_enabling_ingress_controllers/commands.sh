# Apply the Ingress NGINX controller configuration for Kubernetes from the official GitHub repository (for cloud provider environments)
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.3.0/deploy/static/provider/cloud/deploy.yaml

# List all pods running in the ingress-nginx namespace to check the status of the Ingress NGINX controller pods
kubectl get pods --namespace=ingress-nginx

# List all pods in the ingress-nginx namespace, filtering to display only pods with "ingress" in their name
kubectl get pods -n ingress-nginx | grep ingress

# Run a port-forward in the background, forwarding local port 3000 to port 80 of the ingress-nginx-controller service.
# This command also redirects the output to /dev/null to silence it, and runs in the background due to nohup (&).
nohup kubectl port-forward -n ingress-nginx service/ingress-nginx-controller 3000:80 --address 0.0.0.0 > /dev/null 2>&1 &

# Please wait for a few seconds before running the next commands to ensure the port-forward is established.

# Test the Ingress NGINX controller's health endpoint
curl -i "0.0.0.0:3000/healthz"

# Test a custom endpoint on the Ingress NGINX controller (assuming there is an endpoint configured at /something)
curl -i "0.0.0.0:3000/something"
