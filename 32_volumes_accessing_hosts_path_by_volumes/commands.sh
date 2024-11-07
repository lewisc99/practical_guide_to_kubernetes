# Run a new pod named "docker" using the Docker 17.11 image, and specify that it should not restart automatically
kubectl run docker \
    --image=docker:17.11 --restart=Never \
    docker image ls

# Get a list of all pods in the current namespace
kubectl get pods

# Follow (stream) the logs of the "docker" pod to see its output in real-time
kubectl logs -f docker 

# Delete the "docker" pod to clean up after use
kubectl delete pod docker
