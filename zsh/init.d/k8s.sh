source <(kubectl completion zsh)

alias k="kubectl"
alias mk="minikube"
alias k.gap="kubectl get pods --all-namespaces"
alias k.wgap="watch kubectl get pods --all-namespaces"

function kan() {
    kubectl $* --all-namespaces
}

# usage: mk.start4 [args]
function mk.start4() {
    minikube start --memory=4096 $*
    minikube ssh -- sudo ln -s /hosthome/$USER /home/$USER
}

# usage: mk.start [args]
function mk.start() {
    minikube start $*
    minikube ssh -- sudo ln -s /hosthome/$USER /home/$USER
}

# usage: mk.load [filter]
function mk.load() {
    docker images |
    awk '$1 ~ "^quay.io/weaveworks" && $2 == "latest" {print $1 ":" $2}' |
    grep $1 |
    while read img; do
        echo $img
        docker save $img |
        (eval $(minikube docker-env) && docker load)
    done
}

function mk.env() {
    eval $(minikube docker-env)
}

function mk.envu() {
    eval $(minikube docker-env -u)
}

function mk.reload() {
    kubectl get pods --all-namespaces -o json |
    jq -r --arg image "$1" '
    .items[]|
    select(
        .spec.containers | any(.image == $image)
        )|
        .metadata|
        "\(.namespace) \(.name)"
        ' | while read namespace name; do
        echo "Deleting $namespace/$name"
        kubectl delete pod --namespace="$namespace" "$name"
    done
}
