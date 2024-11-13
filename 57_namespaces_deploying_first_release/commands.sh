#update image and create go-demo-2.yml 
IMG=vfarcic/go-demo-2

#windows
$IMG = "vfarcic/go-demo-2"

TAG=1.0

#for windows
$TAG = "1.0"

cat go-demo-2.yml \
    | sed -e \
    "s@image: $IMG@image: $IMG:$TAG@g" \
    | kubectl create -f -

#for windows
(Get-Content go-demo-2.yml) -replace "image: ${IMG}", "image: ${IMG}:${TAG}" | kubectl create -f -

# Rollout status of go-demo-2.yml 
kubectl rollout status \
    deploy go-demo-2-api

# Building connection and calling application 
nohup kubectl port-forward service/go-demo-2-api 3000:8080 --address 0.0.0.0 > /dev/null 2>&1 &

# Please wait fpr a few second before running the following command:
curl -H "Host: go-demo-2.com"  "http://0.0.0.0:3000/demo/hello"

#for windows
curl.exe -H "Host: go-demo-2.com" "http://localhost:3000/demo/hello"