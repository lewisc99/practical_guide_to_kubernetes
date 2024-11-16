# Set the Kubernetes cluster configuration for jdoe using the certificate authority and server
# This is for a Unix-like system (Linux/Mac) and uses the path /usercode/certs/keys/server-ca.crt for the certificate
# The $SERVER variable contains the server URL for the Kubernetes API server
kubectl config set-cluster jdoe \
    --certificate-authority \
    /usercode/certs/keys/server-ca.crt \
    --server $SERVER

# For Windows using Minikube:
# Set the Kubernetes cluster configuration for jdoe using the certificate authority and the Minikube server URL
# This command sets the cluster with the CA certificate located at C:\Users\Pichau\Desktop\keys\ca.crt and the server URL from Minikube
kubectl config set-cluster jdoe \
    --certificate-authority C:\Users\Pichau\Desktop\keys\ca.crt \
    --server https://192.168.59.100:8443


# Set the credentials for the user jdoe with the client certificate and client key
# The client certificate and key are located in the 'keys' folder for Unix-like systems
kubectl config set-credentials jdoe \
    --client-certificate keys/jdoe.crt \
    --client-key keys/jdoe.key

# For Windows using Minikube:
# Set the credentials for the user jdoe with the client certificate and client key located at C:\Users\Pichau\Desktop\keys
kubectl config set-credentials jdoe \
    --client-certificate C:\Users\Pichau\Desktop\keys\jdoe.crt \
    --client-key C:\Users\Pichau\Desktop\keys\jdoe.key

# Set the context for jdoe with the cluster jdoe and user jdoe
# This associates the cluster configuration and the user credentials with a named context
kubectl config set-context jdoe \
    --cluster jdoe \
    --user jdoe

# For Windows using Minikube:
# Set the context for jdoe with the cluster jdoe and user jdoe (same as above but for Windows paths)
kubectl config set-context jdoe \
    --cluster jdoe \
    --user jdoe

# Use the context jdoe for kubectl commands, switching to the jdoe context
# This makes sure subsequent kubectl commands use the configuration of the jdoe context
kubectl config use-context jdoe

# View the current Kubernetes configuration
# This displays the current cluster, user, and context configurations that kubectl is using
kubectl config view

# Get the list of all pods in the current context/cluster
# This lists the running pods in the Kubernetes cluster
kubectl get pods

# Get the list of all resources (pods, services, deployments, etc.)
# This shows all resources in the current cluster and context
kubectl get all
