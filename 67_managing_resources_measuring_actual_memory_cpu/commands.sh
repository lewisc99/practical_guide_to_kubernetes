# Apply the configuration specified in the go-demo-2-insuf-mem.yml file.
# The --record flag annotates the resource with the command used to create it.
kubectl apply -f go-demo-2-insuf-mem.yml --record

# List all pods in the current namespace.
kubectl get pods

# NAME                             READY   STATUS             RESTARTS       AGE
# go-demo-2-api-7589f77856-2cf7d   1/1     Running            1 (6d8h ago)   6d9h
# go-demo-2-api-7589f77856-sn6cd   1/1     Running            1 (6d8h ago)   6d9h
# go-demo-2-api-7589f77856-tzjr7   1/1     Running            1 (6d8h ago)   6d9h
# go-demo-2-api-7fdd54cfc5-f9j65   0/1     Running            0              6s
# go-demo-2-db-5f99468cbf-x6lxx    0/1     CrashLoopBackOff   1 (2s ago)     5s

# Display detailed information about the pod named "go-demo-2-db".
kubectl describe pod go-demo-2-db

# Containers:
#   db:
#     Container ID:   docker://6dc2b652cfa9904b11ba6a04b38b9fbf13aade345550f33962300a51c994d782
#     Image:          mongo:3.3
#     Image ID:       docker-pullable://mongo@sha256:08a90c3d7c40aca81f234f0b2aaeed0254054b1c6705087b10da1c1901d07b5d
#     Port:           <none>
#     Host Port:      <none>
#     State:          Terminated
#       Reason:       OOMKilled
#       Exit Code:    137
#       Started:      Thu, 21 Nov 2024 22:16:41 -0300
#       Finished:     Thu, 21 Nov 2024 22:16:42 -0300
#     Last State:     Terminated
#       Reason:       OOMKilled
