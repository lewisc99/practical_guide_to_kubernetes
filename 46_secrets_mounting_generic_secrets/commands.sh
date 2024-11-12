# Apply the configuration from the jenkins.yml file to create or update Jenkins resources
kubectl apply -f jenkins.yml

# Check the rollout status of the Jenkins deployment to confirm that it is successfully deployed
kubectl rollout status deploy jenkins

# Store the name of the Jenkins master pod in the POD_NAME variable by filtering based on labels
POD_NAME=$(kubectl get pods \
    -l service=jenkins,type=master \
    -o jsonpath="{.items[*].metadata.name}")

# List the contents of the /etc/secrets directory inside the Jenkins master pod
# to check if the secret files are mounted correctly
kubectl exec -it $POD_NAME \
    -- ls /etc/secrets

# Display the contents of the jenkins-user secret file inside the Jenkins master pod
kubectl exec -it $POD_NAME \
    -- cat /etc/secrets/jenkins-user

# Forward local port 3000 to the Jenkins service's port 8080,
# allowing access to Jenkins at http://<your-IP>:3000 from any IP address
kubectl port-forward service/jenkins 3000:8080 --address 0.0.0.0 

# Delete the k3d Kubernetes cluster named "mycluster" along with all associated resources
k3d cluster delete mycluster --all
