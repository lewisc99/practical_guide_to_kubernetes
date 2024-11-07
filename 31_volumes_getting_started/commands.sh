k3d cluster create mycluster --volume "/usercode/volume/prometheus-conf.yml:/files/prometheus-conf.yml"

#local
k3d cluster create mycluster --volume "prometheus-conf.yml:/files/prometheus-conf.yml"

#minikube
cp volume/prometheus-conf.yml \
    ~/.minikube/files