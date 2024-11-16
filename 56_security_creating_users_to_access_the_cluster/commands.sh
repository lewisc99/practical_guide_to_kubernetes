# Create a directory named 'keys' to store all the generated keys and certificates
mkdir keys

# Generate a new RSA private key (2048-bit) for the user 'jdoe' and save it as 'jdoe.key'
openssl genrsa \
    -out keys/jdoe.key 2048

# Create a Certificate Signing Request (CSR) using the private key 'jdoe.key' 
# with the subject /CN=jdoe/O=devs (common name 'jdoe' and organization 'devs')
openssl req -new \
    -key keys/jdoe.key \
    -out keys/jdoe.csr \
    -subj "/CN=jdoe/O=devs"

# List files in the directory '/usercode/certs/' that match 'client-ca.*' (to see the client CA certificate files)
ls -1 /usercode/certs/client-ca.*

# Sign the CSR 'jdoe.csr' using the root CA certificate ('client-ca.crt') and its private key ('client-ca.key')
# This creates the user certificate 'jdoe.crt' valid for 365 days
openssl x509 -req \
    -in keys/jdoe.csr \
    -CA /usercode/certs/client-ca.crt \
    -CAkey /usercode/certs/client-ca.key \
    -CAcreateserial \
    -out keys/jdoe.crt \
    -days 365

# Copy the 'server-ca.crt' from '/usercode/certs/' to '/usercode/certs/keys'
cp /usercode/certs/server-ca.crt /usercode/certs/keys

# List the files in the 'keys' directory to verify the generated certificate and key files
ls -1 keys

# Retrieve the Kubernetes server URL for the cluster 'k3d-mycluster' from the kubectl configuration
SERVER=$(kubectl config view \
    -o jsonpath='{.clusters[?(@.name=="k3d-mycluster")].cluster.server}')

# Output the Kubernetes server URL (e.g., https://192.168.59.100:8443)
echo $SERVER




# ---------------------------------------------------------
# For Windows, using minikube
# ---------------------------------------------------------

# Create a directory named 'keys' on the desktop to store generated keys and certificates
mkdir keys

# Generate a new RSA private key (2048-bit) for the user 'jdoe' on Windows and save it as 'jdoe.key'
openssl genrsa -out keys/jdoe.key 2048

# Create a Certificate Signing Request (CSR) for 'jdoe' on Windows, using the private key 'jdoe.key'
# The subject is "/CN=jdoe/O=devs"
openssl req -new   -key keys/jdoe.key   -out keys/jdoe.csr   -subj "/CN=jdoe/O=devs"

# List the certificate files in the minikube directory for reference
ls ~/.minikube/ca.*

# Sign the CSR 'jdoe.csr' with the Minikube CA certificate ('ca.crt') and its private key ('ca.key')
# This generates the user certificate 'jdoe.crt' valid for 365 days
openssl x509 -req   -in C:\Users\Pichau\Desktop\keys\jdoe.csr   -CA C:\Users\Pichau\.minikube\ca.crt   -CAkey C:\Users\Pichau\.minikube\ca.key   -CAcreateserial   -out C:\Users\Pichau\Desktop\keys\jdoe.crt   -days 365

# Copy the Minikube CA certificate ('ca.crt') to the desktop 'keys' directory for later use
Copy-Item -Path "$env:USERPROFILE\.minikube\ca.crt" -Destination "C:\Users\Pichau\Desktop\keys"

# List the files in the 'keys' directory on the desktop to confirm the copied certificates
ls C:\Users\Pichau\Desktop\keys


# Retrieve the Kubernetes server URL for the 'minikube' cluster from the kubectl configuration
$SERVER = kubectl config view -o jsonpath="{.clusters[?(@.name=='minikube')].cluster.server}"

# Output the Kubernetes server URL (e.g., https://192.168.59.100:8443)
Write-Output $SERVER
