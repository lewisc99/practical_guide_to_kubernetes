# We’ll store the name in an environment variable so that it is easily accessible
export NAME=devops23.k8s.local


# Windows
$env:NAME = "devops23.k8s.local"


# The command that creates an S3 bucket in our region is as follows:
export BUCKET_NAME=devops23-$(date +%s)
aws s3api create-bucket \
    --bucket $BUCKET_NAME \
    --create-bucket-configuration \
    LocationConstraint=$AWS_DEFAULT_REGION

# Windows
$env:BUCKET_NAME = "devops23-" + (Get-Date -UFormat "%s").Replace(',', '')

# Validate:
Write-Host "BUCKET_NAME: $env:BUCKET_NAME"

# PowerShell requires careful handling of JSON strings 
# to ensure proper escaping when passing them to AWS CLI. Update $config:

$config = '{"LocationConstraint":"us-east-1"}'

aws s3api create-bucket `
    --bucket $env:BUCKET_NAME `
    --create-bucket-configuration "$config" `
    --region us-east-1


# Special Case for us-east-1
# If your region is us-east-1, the --create-bucket-configuration 
# parameter is not required. Use this instead:
aws s3api create-bucket `
    --bucket $env:BUCKET_NAME `
    --region us-east-1


#result
# {
#     "Location": "http://devops23-1519993212.s3.amazonaws.com/"
# }

# For simplicity, we’ll define the environment variable KOPS_STATE_STORE.
# kOps will use it to know where we store the state. 
# Otherwise, we’d need to use --store argument with every kops command
export KOPS_STATE_STORE=s3://$BUCKET_NAME

# Windows
$env:KOPS_STATE_STORE = "s3://$env:BUCKET_NAME"

# INSTALLING KOPS
#  we can download a release from GitHub
wget -O kops https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
chmod +x ./kops
sudo mv ./kops /usr/local/bin/
 
# linux
wget -O kops https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
chmod +x ./kops
sudo mv ./kops /usr/local/bin/
 
# Windows link
# https://github.com/kubernetes/kops/releases