# Create resources defined in the jenkins-unprotected.yml file,
# save the configuration for future use, and record the command in the resource's annotations
kubectl create \
    -f jenkins-unprotected.yml \
    --record --save-config

# Check the rollout status of the Jenkins deployment to ensure it's complete
kubectl rollout status deploy jenkins

# Forward local port 3000 to the Jenkins service's port 8080,
# making it accessible at http://<your-IP>:3000 from any IP address
kubectl port-forward service/jenkins 3000:8080 --address 0.0.0.0 

# Retrieve all secrets in the current namespace (useful for checking Jenkins-related secrets if any)
kubectl get secrets

# Describe all pods in the current namespace, displaying detailed information for each pod
kubectl describe pods

# Store the name of the Jenkins master pod in the POD_NAME variable by filtering based on labels
POD_NAME=$(kubectl get pods \
    -l service=jenkins,type=master \
    -o jsonpath="{.items[*].metadata.name}")

# Execute an interactive command inside the Jenkins master pod
# to list the contents of the Kubernetes service account directory,
# which contains authentication information for API access
kubectl exec -it $POD_NAME -- ls \
    /var/run/secrets/kubernetes.io/serviceaccount
