source <(kubectl completion zsh)

function mk.start() {
  minikube start --vm-driver=virtualbox --memory=4096
  minikube ssh -- sudo ln -s /hosthome/$USER /home/$USER
}

function mk.env() {
  eval $(minikube docker-env)
}

function mk.load() {
  docker images |
  awk '$1 ~ "^quay.io/weaveworks" && $2 == "latest" {print $1 ":" $2}' |
  while read img; do
    docker save $img |
    (eval $(minikube docker-env) && docker load)
  done
}
