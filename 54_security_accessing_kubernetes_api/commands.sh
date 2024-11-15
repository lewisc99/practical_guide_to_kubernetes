# Displays the API server URL for the 'k3d-mycluster' context from the kubeconfig file.
# The JSONPath expression filters the output to show only the server address.
kubectl config view \
    -o jsonpath='{.clusters[?(@.name=="k3d-mycluster")].cluster.server}'

# Lists the contents of the 'certs' directory under 'usercode'. 
# This is often used to check for certificates required for secure API access.
ls usercode/certs

# -----------------------
# Minikube-specific commands
# -----------------------

# Retrieves the API server URL for the 'minikube' cluster context.
# This is useful for directly accessing the Kubernetes API of a minikube cluster.
kubectl config view \
    -o jsonpath='{.clusters[?(@.name=="minikube")].cluster.server}'

# Retrieves the path to the certificate authority (CA) file used by the 'minikube' cluster.
# The CA is needed for secure communication with the API server.
kubectl config view \
    -o jsonpath='{.clusters[?(@.name=="minikube")].cluster.certificate-authority}'

# -----------------------
# Alternative ways to get Kubernetes API information
# -----------------------

# Displays general cluster information, including the control plane's URL and key services like CoreDNS.
kubectl cluster-info
# Example output:
# Kubernetes control plane is running at https://kubernetes.docker.internal:6443
# CoreDNS is running at https://kubernetes.docker.internal:6443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

# Starts a local proxy server to interact with the Kubernetes API server securely.
# The proxy listens on localhost (127.0.0.1) and by default uses port 8001.
kubectl proxy
# Example output:
# Starting to serve on 127.0.0.1:8001

# -----------------------
# Using the proxy to access the Kubernetes API
# -----------------------

# From another terminal, sends a GET request to the API server through the proxy to list all Pods in the 'default' namespace.
# The proxy forwards the request securely to the actual API server.
curl.exe http://127.0.0.1:8001/api/v1/namespaces/default/pods
# Example response:
# {
#   "kind": "PodList",
#   "apiVersion": "v1",
#   "metadata": {
#     "resourceVersion": "1867"
#   },
#   "items": []
# }
