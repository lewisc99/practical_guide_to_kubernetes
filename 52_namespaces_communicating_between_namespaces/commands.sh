# Switches the current kubectl context to 'k3d-mycluster'. 
# A context defines a cluster, a user, and a namespace for kubectl to interact with.
kubectl config use-context k3d-mycluster

# Switches the kubectl context to 'default'. 
# This is typically the default context set when Kubernetes is initially configured.
kubectl config use-context default

# Changes the namespace of the current context to 'default'. 
# This ensures kubectl commands will operate in the 'default' namespace unless specified otherwise.
kubectl config set-context --current --namespace=default

# Creates a new Pod named 'test' using the 'alpine' image and runs a sleep command for 10,000 seconds. 
# Useful for temporary testing or debugging.
kubectl run test \
    --image=alpine \
    sleep 10000

# Retrieves the details of the Pod named 'test'. 
# This confirms whether the Pod is running and provides its status.
kubectl get pod test

# Executes an interactive terminal session in the 'test' Pod and installs the 'curl' package using Alpine's package manager (apk).
kubectl exec -it test \
    -- apk add -U curl

# Executes a curl command from within the 'test' Pod to send a request to the service 'go-demo-2-api' on port 8080, accessing the '/demo/hello' endpoint.
kubectl exec -it test -- curl \
    "http://go-demo-2-api:8080/demo/hello"

# Executes a similar curl command as above but targets a service 'go-demo-2-api' in the namespace 'testing'. 
# The DNS name includes the namespace to specify the service in the correct namespace.
kubectl exec -it test -- curl \
    "http://go-demo-2-api.testing:8080/demo/hello"
                