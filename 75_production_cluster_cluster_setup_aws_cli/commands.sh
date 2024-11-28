# Clone the k8s-specs repository from GitHub to your local machine.
git clone https://github.com/vfarcic/k8s-specs.git

# Change the directory to the cloned repository (k8s-specs).
cd k8s-specs

# Check the installed version of the AWS CLI to ensure it's correctly set up.
aws --version

# Set the AWS_DEFAULT_REGION environment variable to "us-east-2" for the current session in Unix-like systems.
export AWS_DEFAULT_REGION=us-east-2

# Windows: Set the AWS_DEFAULT_REGION environment variable to "us-east-2" for the current session in PowerShell.
$env:AWS_DEFAULT_REGION="us-east-2"
