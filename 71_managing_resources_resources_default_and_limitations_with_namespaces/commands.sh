# Create a new namespace named "test".
kubectl create ns test

# In the "test" namespace, create resources defined in the limit-range.yml file,
# save the configuration for future use, and record the command for rollout history.
kubectl --namespace test create \
    -f limit-range.yml \
    --save-config --record

# Describe the "test" namespace to get detailed information about it,
# including its status and resource quotas.
kubectl describe namespace test

# In the "test" namespace, create resources defined in the go-demo-2-no-res.yml file,
# save the configuration for future use, and record the command for rollout history.
kubectl --namespace test create \
    -f go-demo-2-no-res.yml \
    --save-config --record

# Check the status of the rollout for the deployment named go-demo-2-api
# in the "test" namespace.
kubectl --namespace test \
    rollout status \
    deployment go-demo-2-api

# In the "test" namespace, describe the specified pod (go-demo-2-db)
# to get detailed information about it, including its status, events, and container details.
kubectl --namespace test describe \
    pod go-demo-2-db

