# Create a ConfigMap named "my-config" with two key-value pairs: "something" set to "else" and "weather" set to "sunny".
kubectl create cm my-config --from-literal=something=else --from-literal=weather=sunny

# Get the ConfigMap named "my-config" and output its details in YAML format.
kubectl get cm my-config -o yaml

# Create a pod using the configuration specified in the alpine.yml file.
kubectl create -f alpine.yml

# Wait a few seconds before executing the following command to ensure the alpine pod is up and running.
# List the contents of the /etc/config directory inside the alpine pod.
kubectl exec -it alpine -- ls /etc/config

# Display the contents of the "something" file in the /etc/config directory inside the alpine pod.
kubectl exec -it alpine -- cat /etc/config/something

# Delete the alpine pod using the configuration specified in the alpine.yml file.
kubectl delete -f alpine.yml

# Run the below command separately to delete the ConfigMap named "my-config".
kubectl delete cm my-config
