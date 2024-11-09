# Apply the configuration file to create the Jenkins deployment using an EmptyDir volume.
kubectl apply -f jenkins-empty-dir.yml

# Check the rollout status of the Jenkins deployment to ensure it has been successfully deployed.
kubectl rollout status deploy jenkins

# Forward port 8080 of the Jenkins service to port 3000 on all IP addresses (0.0.0.0).
kubectl port-forward service/jenkins 3000:8080 --address 0.0.0.0
# Open the link beside the run button to access the Jenkins service.
# Add a new job in Jenkins.

# Store the name of the Jenkins master pod in the POD_NAME variable.
$POD_NAME = kubectl get pods -l service=jenkins,type=master -o jsonpath="{.items[*].metadata.name}"

# Execute a command inside the Jenkins master pod to kill the process with PID 1, causing the pod to restart.
kubectl exec $POD_NAME -- kill 1

# List all the pods to verify the state of the Jenkins pod.
kubectl get pods

# Forward port 8080 of the Jenkins service to port 3000 on all IP addresses (0.0.0.0) again.
kubectl port-forward service/jenkins 3000:8080 --address 0.0.0.0
# Open the link beside the run button and remove /newJob at the end to access the Jenkins service.

# Delete the k3d cluster named "mycluster" and remove all associated resources.
k3d cluster delete mycluster --all
