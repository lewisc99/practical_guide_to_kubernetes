# Enable Kubernetes in Docker Desktop (Settings step)
kubectl cluster-info                                # Verify cluster info
kubectl create namespace testing                    # Create testing namespace
kubectl get namespaces                              # Confirm creation of namespace
kubectl config set-context --current --namespace=testing   # Set default namespace
kubectl config view --minify                        # Verify current context and namespace
kubectl run test-pod --image=nginx --restart=Never  # Deploy a test pod
kubectl get pods                                    # Check the pod in the testing namespace
kubectl delete pod test-pod                         # Clean up the test pod