# Updates the image in the ReplicaSet configuration (go-demo-2-api.yml) for the 'api' container
# to a non-existent version (vfarcic/go-demo-2:does-not-exist) and records this change.
kubectl set image -f go-demo-2-api.yml api=vfarcic/go-demo-2:does-not-exist --record

# Retrieves all ReplicaSets with the label 'type=api', allowing verification of ReplicaSet details
# after applying the image change.
kubectl get rs -l type=api

# Checks the status of the rollout for the configuration file go-demo-2-api.yml,
# ensuring the rollout is progressing as expected.
kubectl rollout status -f go-demo-2-api.yml

# Prints the exit code of the last command; $? is generally 0 if successful and non-zero if there
# was an issue, helping to verify if the rollout status command completed successfully.
echo $?

# Undoes the last rollout for the configuration in go-demo-2-api.yml, reverting to the previous
# stable state after an unsuccessful update.
kubectl rollout undo -f go-demo-2-api.yml

# Verifies the status of the rollout after the undo command to ensure the rollback has completed.
kubectl rollout status -f go-demo-2-api.yml

# Deletes the resources defined in the configuration file go-demo-2-db.yml, typically removing
# database-related objects from the cluster.
kubectl delete -f go-demo-2-db.yml

# Deletes the service defined in the configuration file go-demo-2-db-svc.yml, typically removing
# the service that allows communication with the database.
kubectl delete -f go-demo-2-db-svc.yml

# Deletes the resources defined in the configuration file go-demo-2-api.yml, typically removing
# the API application resources from the cluster.
kubectl delete -f go-demo-2-api.yml
