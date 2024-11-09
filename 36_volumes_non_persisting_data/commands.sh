# Create a Jenkins deployment using the configuration in jenkins.yml, record the command, and save the configuration for future use.
kubectl create -f jenkins.yml --record --save-config

# Check the rollout status of the Jenkins deployment to ensure it has been successfully deployed.
kubectl rollout status deploy jenkins

# Forward port 8080 of the Jenkins service to port 3000 on all IP addresses (0.0.0.0).
kubectl port-forward service/jenkins 3000:8080 --address 0.0.0.0
# Click the link beside the run button to access the Jenkins service.

# Forward port 8080 of the Jenkins service to port 3000 on all IP addresses (0.0.0.0) again.
kubectl port-forward service/jenkins 3000:8080 --address 0.0.0.0
# Click the link beside the run button and add /newJob at the end to create a new job in Jenkins.

# Store the name of the Jenkins master pod in the POD_NAME variable.
$POD_NAME = kubectl get pods -l service=jenkins,type=master -o jsonpath="{.items[*].metadata.name}"

# Execute a command inside the Jenkins master pod to kill the process with PID 1, causing the pod to restart.
kubectl exec $POD_NAME -it -- kill 1

# List all the pods to verify the state of the Jenkins pod.
kubectl get pods

# Forward port 8080 of the Jenkins service to port 3000 on all IP addresses (0.0.0.0) once more.
kubectl port-forward service/jenkins 3000:8080 --address 0.0.0.0
# Click the link beside the run button to access the Jenkins service again.
