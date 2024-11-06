# Deploy resources defined in the `devops-toolkit.yml` file.
# --record adds the command to the resource's annotation, which is useful for tracking changes.
# --save-config updates the resource's configuration in the cluster with the content of this file.
kubectl create -f devops-toolkit.yml --record --save-config

# Retrieve information on all Ingress resources in the current namespace.
# This lists the status and rules for each Ingress, showing the routes configured for services.
kubectl get ing

# Run `kubectl port-forward` to forward traffic from a local port (3000) to a service in the Kubernetes cluster.
# -n ingress-nginx specifies the namespace, targeting the ingress-nginx-controller service on port 80.
# --address 0.0.0.0 makes it accessible from any network interface.
# nohup runs the command in the background, even if the terminal closes.
# Output redirection `> /dev/null 2>&1 &` suppresses logs and errors, running silently in the background.
nohup kubectl port-forward -n ingress-nginx service/ingress-nginx-controller 3000:80 --address 0.0.0.0 > /dev/null 2>&1 &

#for windows
kubectl port-forward -n ingress-nginx service/ingress-nginx-controller 3000:80 --address 0.0.0.0

# Test the port-forwarding by sending a request to the local IP (0.0.0.0) on port 3000.
# This request should be routed to the ingress service, accessing the `/demo/hello` endpoint.
curl "http://0.0.0.0:3000/demo/hello"

#windows
curl.exe "http://localhost:3000/demo/hello"