# Create a pod using the configuration specified in the alpine-env.yml file.
kubectl create -f alpine-env.yml

# Wait for a few seconds before executing the below command to ensure the alpine-env pod is up and running.
# Execute the env command inside the alpine-env pod to display all environment variables.
kubectl exec -it alpine-env -- env

# Delete the alpine-env pod using the configuration specified in the alpine-env.yml file.
kubectl delete -f alpine-env.yml

# Create a pod using the configuration specified in the alpine-env-all.yml file.
kubectl create -f alpine-env-all.yml

# Wait for a few seconds before executing the below command to ensure the alpine-env pod is up and running.
# Execute the env command inside the alpine-env pod to display all environment variables.
kubectl exec -it alpine-env -- env
