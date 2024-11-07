# Run `kubectl port-forward` to forward local port 3000 to port 80 on the ingress-nginx-controller service in the ingress-nginx namespace.
# -n ingress-nginx specifies the namespace of the service.
# --address 0.0.0.0 allows access from all network interfaces on the local machine.
# `nohup` allows the command to keep running in the background even if the terminal is closed.
# `> /dev/null 2>&1 &` suppresses all output and errors, running silently in the background.
nohup kubectl port-forward -n ingress-nginx service/ingress-nginx-controller 3000:80 --address 0.0.0.0 > /dev/null 2>&1 &

#local windows
kubectl port-forward -n ingress-nginx service/ingress-nginx-controller 3000:80 --address 0.0.0.0

# Create resources defined in `default-backend.yml`.
# This file typically configures a default backend, which handles requests that do not match any Ingress rules.
kubectl create -f default-backend.yml

# Run `kubectl port-forward` again to set up port forwarding from local port 3000 to port 80 on the ingress-nginx-controller service.
# This command repeats the port-forward setup, possibly ensuring the connection remains active after deploying new configurations.
nohup kubectl port-forward -n ingress-nginx service/ingress-nginx-controller 3000:80 --address 0.0.0.0 > /dev/null 2>&1 &

#local windows
kubectl port-forward -n ingress-nginx service/ingress-nginx-controller 3000:80 --address 0.0.0.0


# Send an HTTP HEAD request to test access to the service on local port 3000.
# The `-I` option retrieves only the response headers.
# Setting the Host header to `acme.com` simulates a request directed to that specific hostname, which is useful for testing hostname-based routing configurations.
curl -I -H "Host: acme.com" "http://0.0.0.0:3000"

#local windows
curl.exe -I -H "Host: acme.com" "http://localhost:3000"


# Delete the `mycluster` cluster created by k3d.
# The `--all` option removes all associated resources, such as network settings and volumes, ensuring a complete deletion.
k3d cluster delete mycluster --all
