# Extract the subject from a Certificate Signing Request (CSR) file.
# The -noout flag suppresses the output of the encoded CSR, and -subject outputs the subject field from the CSR.
openssl req -in /usercode/certs/keys/jdoe.csr -noout -subject

# Switch the active context to "k3d-mycluster" to interact with the specific cluster.
kubectl config use-context k3d-mycluster

# Apply the configuration specified in the groups.yml file.
# The --record flag annotates the resource with the command used to create it.
kubectl apply -f groups.yml --record

# Check if the user "jdoe" has permission to create deployments in the "dev" namespace.
kubectl --namespace dev auth can-i create deployments --as jdoe

# Switch the active context to "jdoe" to interact with the cluster as the user "jdoe".
kubectl config use-context jdoe

# Create a deployment named "new-db" in the "dev" namespace using the "mongo:3.3" image.
kubectl --namespace dev create deployment new-db --image mongo:3.3

# Delete the cluster named "mycluster" and all associated resources.
k3d cluster delete mycluster --all
