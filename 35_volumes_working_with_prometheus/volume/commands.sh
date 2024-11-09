# Apply the configuration file to create the Prometheus volume using hostPath.
kubectl apply -f volume/prometheus-host-path.yml

# Check the rollout status of the Prometheus deployment to ensure it has been successfully deployed.
kubectl rollout status deploy prometheus

# Forward port 9090 of the Prometheus service to port 3000 on all IP addresses (0.0.0.0).
kubectl port-forward service/prometheus --address 0.0.0.0  3000:9090

# Delete the Prometheus volume configuration when it's no longer needed.
kubectl delete -f volume/prometheus-host-path.yml