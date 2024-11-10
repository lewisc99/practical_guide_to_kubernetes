# Get the ConfigMap named "my-config" and output its details in YAML format.
kubectl get cm my-config -o yaml

# Create a deployment using the configuration specified in the prometheus.yml file.
kubectl create -f prometheus.yml

# Check the rollout status of the Prometheus deployment to ensure it has been successfully deployed.
kubectl rollout status deploy prometheus

# Wait for deployments to successfully roll out before running the following command.
# Forward port 9090 of the Prometheus service to port 3000 on all IP addresses (0.0.0.0).
kubectl port-forward service/prometheus 3000:9090 --address 0.0.0.0
# Click the link beside the run button to access the Prometheus service.

# Delete the k3d cluster named "mycluster" and remove all associated resources.
k3d cluster delete mycluster --all
