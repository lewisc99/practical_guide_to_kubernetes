# Create a Kubernetes pod using the configuration specified in docker.yml.
# This file should define the pod's containers, volumes, and any required settings.
kubectl create -f docker.yml

# Execute a Docker command within the running "docker" pod in Kubernetes.
# This command lists all Docker images within the container, formatted to show only the repository names.
kubectl exec -it docker -- docker image ls --format "{{.Repository}}"

# Start an interactive shell session inside the "docker" pod.
# This is useful for debugging or running additional commands directly in the pod.
kubectl exec docker -it -- sh

# Install Git within the pod/container.
# The "-U" option updates any existing packages before installing Git, ensuring the latest version.
apk add -U git

# Clone the "go-demo-2" repository from GitHub into the container.
# This is used to retrieve source code that can be built and tested within the pod.
git clone https://github.com/Faizan-Zia/go-demo-2

# Change directory into the "go-demo-2" folder that was just cloned.
# This folder contains the application's source code and Dockerfile for building the Docker image.
cd go-demo-2

# Build a Docker image from the "go-demo-2" source code and tag it as "vfarcic/go-demo-2:beta".
# This command compiles the application and packages it into a Docker image, ready for deployment or testing.
docker image build -t vfarcic/go-demo-2:beta .

# List Docker images available within the container, showing only the repository names for simplicity.
# This command verifies that the newly built image (or other relevant images) is available.
docker image ls --format "{{.Repository}}"

# Clean up unused Docker data to free up space within the container.
# This command removes all stopped containers, unused networks, dangling images, and caches.
docker system prune -f

# List Docker images again after cleanup to confirm which images remain.
# This helps ensure that only necessary images are kept and that space was freed successfully.
docker image ls --format "{{.Repository}}"

# Exit the interactive shell session in the container.
exit

# Delete the "docker" pod using the configuration file to clean up resources.
# This command removes the pod and any associated resources created by docker.yml.
kubectl delete -f docker.yml
