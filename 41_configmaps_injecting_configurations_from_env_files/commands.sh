# Create a ConfigMap named "my-config" from the environment variables specified in the my-env-file.yml file.
kubectl create cm my-config --from-env-file=my-env-file.yml

# Get the ConfigMap named "my-config" and output its details in YAML format.
kubectl get cm my-config -o yaml
