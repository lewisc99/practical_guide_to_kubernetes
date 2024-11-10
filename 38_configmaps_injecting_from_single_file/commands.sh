# Create a ConfigMap named "my-config" from the prometheus-conf.yml file.
kubectl create cm my-config --from-file=prometheus-conf.yml

# Describe the details of the ConfigMap named "my-config" to see its contents.
kubectl describe cm my-config

# Create a pod using the configuration specified in the alpine.yml file.
kubectl create -f alpine.yml

# Get a list of all pods to verify the alpine pod is running.
kubectl get pods

# Execute a command inside the alpine pod to list the contents of the /etc/config directory.
kubectl exec -it alpine -- ls /etc/config

# Execute a command inside the alpine pod to list the contents of the /etc/config directory with detailed information.
kubectl exec -it alpine -- ls -l /etc/config

# Execute a command inside the alpine pod to display the contents of the prometheus-conf.yml file in the /etc/config directory.
kubectl exec -it alpine -- cat /etc/config/prometheus-conf.yml

# Delete the alpine pod using the configuration specified in the alpine.yml file.
kubectl delete -f alpine.yml

# Delete the ConfigMap named "my-config".
kubectl delete cm my-config
