aws iam create-group \
    --group-name kops


#policies

aws iam attach-group-policy \
    --policy-arn arn:aws:iam::aws:policy/AmazonEC2FullAccess \
    --group-name kops

aws iam attach-group-policy \
    --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess \
    --group-name kops

aws iam attach-group-policy \
    --policy-arn arn:aws:iam::aws:policy/AmazonVPCFullAccess \
    --group-name kops

aws iam attach-group-policy \
    --policy-arn arn:aws:iam::aws:policy/IAMFullAccess \
    --group-name kops


# The user we created does not yet belong to the kops group. Let’s fix that

aws iam add-user-to-group \
    --user-name kops \
    --group-name kops


# We create access keys and store the output in the kops-creds file. Let’s take a quick look at its contents

cat kops-creds

# Note: Windows users shoulduse Chocolatey to install jq from an Administrator Command Prompt via choco install jq

choco install jq


# commands to add var with the access key and secret access key

export AWS_ACCESS_KEY_ID=$(\
    cat kops-creds | jq -r \
    '.AccessKey.AccessKeyId')

export AWS_SECRET_ACCESS_KEY=$(
    cat kops-creds | jq -r \
    '.AccessKey.SecretAccessKey')


#for windows

# Set the AWS_ACCESS_KEY_ID environment variable to the AccessKeyId value
# extracted from the kops-creds file using jq.
$env:AWS_ACCESS_KEY_ID = (Get-Content kops-creds | jq -r '.AccessKey.AccessKeyId')

# Set the AWS_SECRET_ACCESS_KEY environment variable to the SecretAccessKey value
# extracted from the kops-creds file using jq.
$env:AWS_SECRET_ACCESS_KEY = (Get-Content kops-creds | jq -r '.AccessKey.SecretAccessKey')
