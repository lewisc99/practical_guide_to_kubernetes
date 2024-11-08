kubectl create -f prometheus.yml
kubectl rollout status deploy prometheus

kubectl port-forward service/prometheus --address 0.0.0.0  3000:9090
# click the link beside run button

# open the link beside the run button and add /targets at the end

# open the link beside the run button and add /config at the end