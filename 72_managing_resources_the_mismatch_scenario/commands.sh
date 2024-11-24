# Create a new namespace named "test".
kubectl create ns test

# In the "test" namespace, apply the configuration specified in the go-demo-2.yml file
# and record the command for future reference in the rollout history.
kubectl --namespace test apply \
    -f go-demo-2.yml \
    --record

# In the "test" namespace, continuously watch and display events in real-time.
kubectl --namespace test \
    get events \
    --watch

# Delete the "test" namespace, including all resources within it.
kubectl delete namespace test