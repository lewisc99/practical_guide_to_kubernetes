# Create a generic secret named "my-creds" with literal values for username and password
kubectl create secret \
    generic my-creds \
    --from-literal=username=jdoe \
    --from-literal=password=incognito

# List all secrets in the current namespace to verify that "my-creds" was created
kubectl get secrets

# Display the "my-creds" secret in JSON format to see its structure and encoded data
kubectl get secret my-creds -o json

# Retrieve the encoded username from the "my-creds" secret and decode it from base64
kubectl get secret my-creds \
    -o jsonpath="{.data.username}" \
    | base64 --decode

#for windows
kubectl get secret my-creds -o jsonpath="{.data.username}" | ForEach-Object { [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($_)) }

# Retrieve the encoded password from the "my-creds" secret and decode it from base64
kubectl get secret my-creds \
    -o jsonpath="{.data.password}" \
    | base64 --decode

#windows
kubectl get secret my-creds -o jsonpath="{.data.password}" | ForEach-Object { [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($_)) }