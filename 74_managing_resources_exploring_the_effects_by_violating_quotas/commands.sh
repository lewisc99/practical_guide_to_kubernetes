# Create resources defined in the dev.yml file and save the configuration for future use.
# Record the command in the rollout history for tracking.
kubectl create \
    -f dev.yml \
    --record --save-config

# Describe the resource quota named "dev" in the "dev" namespace to get detailed information 
# about its status and usage.
kubectl --namespace dev describe \
    quota dev

# In the "dev" namespace, create resources defined in the go-demo-2.yml file,
# save the configuration for future use, and record the command for rollout history.
kubectl --namespace dev create \
    -f go-demo-2.yml \
    --save-config --record

# Check the status of the rollout for the deployment named go-demo-2-api in the "dev" namespace.
kubectl --namespace dev \
    rollout status \
    deployment go-demo-2-api

# Describe the resource quota named "dev" in the "dev" namespace again to get updated 
# detailed information about its status and usage after creating the new resources.
kubectl --namespace dev describe \
    quota dev

# Name:               dev
# Namespace:          dev
# Resource            Used  Hard
# --------            ----  ----
# limits.cpu          0     1
# limits.memory       0     1Gi
# pods                0     10
# requests.cpu        0     800m
# requests.memory     0     500Mi
# services.nodeports  0     0

# In the "dev" namespace, apply the configuration specified in the go-demo-2-scaled.yml file 
# and record the command for future reference in the rollout history.
kubectl --namespace dev apply \
    -f go-demo-2-scaled.yml \
    --record

# In the "dev" namespace, retrieve and display a list of events that have occurred within the namespace.
kubectl --namespace dev get events

# Describe the "dev" namespace to get detailed information about it, including its status 
# and resource quotas.
kubectl describe namespace dev

# Retrieve and display information about the pods in the "dev" namespace.
kubectl get pods --namespace dev

# In the "dev" namespace, apply the configuration specified in the go-demo-2.yml file 
# and record the command for future reference in the rollout history.
kubectl --namespace dev apply \
    -f go-demo-2.yml \
    --record

# Check the status of the rollout for the deployment named go-demo-2-api in the "dev" namespace.
kubectl --namespace dev \
    rollout status \
    deployment go-demo-2-api

# In the "dev" namespace, apply the configuration specified in the go-demo-2-mem.yml file 
# and record the command for future reference in the rollout history.
kubectl --namespace dev apply \
    -f go-demo-2-mem.yml \
    --record

# In the "dev" namespace, retrieve and display a list of events that have occurred within the namespace,
# and filter the output to include only lines that contain the string "mem".
kubectl --namespace dev get events \
    | grep mem

#for windows
kubectl --namespace dev get events | Select-String "mem"


# Describe the "dev" namespace to get detailed information about it, including its status 
# and resource quotas.
kubectl describe namespace dev

# In the "dev" namespace, apply the configuration specified in the go-demo-2.yml file 
# and record the command for future reference in the rollout history.
kubectl --namespace dev apply \
    -f go-demo-2.yml \
    --record

# Check the status of the rollout for the deployment named go-demo-2-api in the "dev" namespace.
kubectl --namespace dev \
    rollout status \
    deployment go-demo-2-api

# Expose the deployment named go-demo-2-api in the "dev" namespace as a service,
# with the name go-demo-2-api, on port 8080, and of type NodePort.
kubectl expose deployment go-demo-2-api \
    --namespace dev \
    --name go-demo-2-api \
    --port 8080 \
    --type NodePort

# Delete the Kubernetes cluster named mycluster and all its associated resources.
k3d cluster delete mycluster --all
