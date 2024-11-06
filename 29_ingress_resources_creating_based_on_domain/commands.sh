# Apply the configuration in `devops-toolkit-dom.yml` to the cluster.
# The `apply` command is typically used for updates, as it will update existing resources or create them if they don't exist.
# --record stores the command in the resource's annotation, which helps with tracking configuration changes over time.
kubectl apply -f devops-toolkit-dom.yml --record

# Run `kubectl port-forward` to forward traffic from a local port (3000) to the ingress-nginx-controller service within the cluster.
# -n ingress-nginx specifies the namespace, here targeting the ingress-nginx-controller service on port 80.
# --address 0.0.0.0 allows the service to be accessible from any network interface.
# `nohup` runs it in the background, and `> /dev/null 2>&1 &` suppresses output and errors, so it runs quietly in the background.
nohup kubectl port-forward -n ingress-nginx service/ingress-nginx-controller 3000:80 --address 0.0.0.0 > /dev/null 2>&1 &

#window local
kubectl port-forward -n ingress-nginx service/ingress-nginx-controller 3000:80 --address 0.0.0.0


# Send an HTTP GET request to test the port-forwarded service on local port 3000.
# The `-i` option displays the response headers, which is useful for confirming connectivity and checking for headers.
curl -i "http://0.0.0.0:3000"

# windows local
curl.exe -i "http://localhost:3000"


# Send an HTTP HEAD request with a custom `Host` header to test domain-based routing.
# The `-I` option retrieves only the response headers (without the body).
# The Host header simulates a request to `devopstoolkitseries.com`, which can be helpful in verifying hostname-based Ingress routing.
curl -I -H "Host: devopstoolkitseries.com" "http://0.0.0.0:3000"

#windows local
curl.exe -I -H "Host: devopstoolkitseries.com" "http://localhost:3000"


# Send an HTTP GET request to test a different hostname-based route.
# The `Host` header here is set to `acme.com` to test a specific path (`/demo/hello`), simulating domain-based routing for `acme.com`.
curl -H "Host: acme.com" "http://0.0.0.0:3000/demo/hello"

#windows local
curl.exe -H "Host: acme.com" "http://localhost:3000/demo/hello"
