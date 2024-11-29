# In this lesson, we will decide which availability zones we should use. So, let’s look at what’s available in the us-east-2 region
aws ec2 describe-availability-zones \
    --region $AWS_DEFAULT_REGION

#for windows
aws ec2 describe-availability-zones --region us-east-1

# As we can see, the region has three availability zones. We’ll store them in an environment variable.
export ZONES=$(aws ec2 \
    describe-availability-zones \
    --region $AWS_DEFAULT_REGION \
    | jq -r \
    '.AvailabilityZones[].ZoneName' \
    | tr '\n' ',' | tr -d ' ')

ZONES=${ZONES%?}

echo $ZONES

# us-east-2a,us-east-2b,us-east-2c


#for windows

$AWS_DEFAULT_REGION = "us-east-1"


# The last preparation step is to create the SSH keys required for the setup. 
# Since we might create some other artifacts during the process, we’ll create a directory dedicated to the creation of the cluster.
mkdir -p cluster

cd cluster


# SSH keys can be created through the aws ec2 command create-key-pair.
aws ec2 create-key-pair \
    --key-name devops23 \
    | jq -r '.KeyMaterial' \
    >devops23.pem


#For windows

aws ec2 create-key-pair `
    --key-name devops23 | `
    ConvertFrom-Json | `
    Select-Object -ExpandProperty KeyMaterial | `
    Out-File -FilePath devops23.pem -Encoding ascii


# We create a new key pair, filter the output so that only the KeyMaterial is returned, 
# and store it in the devops23.pem file. For security reasons, we should change the permissions of the devops23.pem 
# file so that only the current user can read it.
chmod 400 devops23.pem

#windows 

$path = "D:/arquivos/programation/workspace_kubernetes/month_10/01_practical_guide_to_kubernetes/77_production_cluster_availability_zones_ssh_keys/cluster/devops23.pem"
$acl = Get-Acl $path
$acl.SetAccessRuleProtection($true, $false)

$rules = $acl.Access | Where-Object { $_.IdentityReference -ne [System.Security.Principal.WindowsIdentity]::GetCurrent().Name }
foreach ($rule in $rules) {
    $acl.RemoveAccessRule($rule)
}

Set-Acl $path $acl

#then
$acl = Get-Acl $path
$rule = New-Object System.Security.AccessControl.FileSystemAccessRule([System.Security.Principal.WindowsIdentity]::GetCurrent().Name, "Read", "Allow")
$acl.AddAccessRule($rule)

Set-Acl $path $acl


# Finally, we need only the public segment of the newly generated SSH key, so we’ll use ssh-keygen to extract it.
ssh-keygen -y -f devops23.pem \
    >devops23.pub

# For windows

ssh-keygen -y -f devops23.pem > devops23.pub