# install k3d with the following command - using Windows with Chocolatey
choco install k3d
# After installation, open a new PowerShell window and verify the installation by running:
k3d --version


# We’ll use the k3d cluster create command to create
k3d cluster create mycluster

#get the node we created
kubectl get nodes
# NAME                     STATUS   ROLES                  AGE     VERSION
# k3d-mycluster-server-0   Ready    control-plane,master   2m50s   v1.21.5+k3s1