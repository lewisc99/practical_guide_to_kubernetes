# Update the container image for the "api" container in the "go-demo-2-api" Deployment
# to use version 3.0 of the vfarcic/go-demo-2 image. The --record flag logs this change
# in the rollout history, allowing for easy rollback or history tracking.
kubectl set image -f go-demo-2-api.yml api=vfarcic/go-demo-2:3.0 --record

# Check the rollout status of the "go-demo-2-api" Deployment. This command waits
# until the Deployment is fully rolled out with the new image version (3.0),
# confirming that all new replicas are successfully running.
kubectl rollout status -f go-demo-2-api.yml

# Update the container image for the "api" container in the "go-demo-2-api" Deployment
# to version 4.0 of the vfarcic/go-demo-2 image. Again, the --record flag logs this change
# in the rollout history for tracking.
kubectl set image -f go-demo-2-api.yml api=vfarcic/go-demo-2:4.0 --record

# Monitor the rollout status again, this time for version 4.0. This command waits
# until the Deployment completes rolling out, ensuring the update is fully applied
# and that all necessary replicas are running the latest version.
kubectl rollout status -f go-demo-2-api.yml

# Display the rollout history for the "go-demo-2-api" Deployment. This shows all recorded
# revisions and their change causes (commands used for each change), providing a clear
# view of version changes and updates over time.
kubectl rollout history -f go-demo-2-api.yml

# Roll back the "go-demo-2-api" Deployment to a previous revision (revision 2 in this case),
# effectively reverting the Deployment to the state specified by that revision. This is useful
# if a newer deployment causes issues, as it allows a return to a known good version.
kubectl rollout undo -f go-demo-2-api.yml --to-revision=2

# Display the rollout history again to verify that the rollback to revision 2 was successful.
# This allows us to confirm the current state and ensure that the Deployment is now using
# the specified rollback revision.
kubectl rollout history -f go-demo-2-api.yml
