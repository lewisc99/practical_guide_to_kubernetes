# Create a ConfigMap named "my-config" from the files prometheus-conf.yml and prometheus.yml.
kubectl create cm my-config --from-file=cm/prometheus-conf.yml --from-file=cm/prometheus.yml

# Create a pod using the configuration specified in the alpine.yml file.
kubectl create -f cm/alpine.yml

# Run the following command separately:
# List the contents of the /etc/config directory inside the alpine pod.
kubectl exec -it alpine -- ls /etc/config

# Delete the alpine pod using the configuration specified in the alpine.yml file.
kubectl delete -f cm/alpine.yml

# Run the following command separately to delete the ConfigMap named "my-config".
kubectl delete cm my-config

# Create a ConfigMap named "my-config" from all the files in the cm directory.
kubectl create cm my-config --from-file=cm

# Describe the details of the ConfigMap named "my-config" to see its contents.
kubectl describe cm my-config

# Create a pod using the configuration specified in the alpine.yml file.
kubectl create -f cm/alpine.yml

# Run the below command separately after the "alpine" container is created:
# List the contents of the /etc/config directory inside the alpine pod.
kubectl exec -it alpine -- ls /etc/config

# Delete the alpine pod using the configuration specified in the alpine.yml file.
kubectl delete -f cm/alpine.yml

# Run the following command separately to delete the ConfigMap named "my-config".
kubectl delete cm my-config
