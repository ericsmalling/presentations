#!env bash
. ../demo-magic.sh
export DOCKER_CLI_HINTS=false
TYPE_SPEED=80
docker rm -f prometheus
docker run -d -p 9090:9090 -v $(pwd)/data:/data --name prometheus cgr.dev/chainguard/prometheus:latest --config.file=/etc/prometheus/prometheus.yml
clear

function banner() { 
  # get the length of $1 string
  length=${#1}
  echo
  echo " ╔═$(printf '═%.0s' $(seq 1 $length))═╗"
  echo " ║ ${1} ║"
  echo " ╚═$(printf '═%.0s' $(seq 1 $length))═╝"
}


NO_WAIT=true
banner "We have a "prometheus" container based on a distroless image."
p "docker ps"
docker ps | grep -v kind
echo
wait


banner "Check the web site to make sure it's running."
pe "open http://localhost:9090"
wait


banner "Exec in to see what's in /etc/prometheus/prometheus.yml"
NO_WAIT=false
pe "docker exec -it prometheus bash"
pe "docker exec -it prometheus sh"
pe "docker exec -it prometheus /bin/sh"
wait

banner "Let's try running the the image and override entrypoint to cat it out"
pe "docker run --rm -it --entrypoint /bin/cat cgr.dev/chainguard/prometheus:latest /etc/prometheus/prometheus.yml"
wait

clear
banner "Use Docker Debug"
pe "docker debug prometheus"
wait

banner "Not on paid Docker account?  Docker Desktop free tier UI has options..."
wait

clear
banner "Not on Docker Desktop at all?  cdebug is an OSS CLI tool that can help."
pe "cdebug exec -it --rm prometheus"
pe "cdebug exec -it --rm --privileged prometheus"

clear
banner "What about containers running in Kubernetes?"
NO_WAIT=true
pe "bat demopod.yaml"
NO_WAIT=false
pe "kubectl apply -f demopod.yaml"
NO_WAIT=true
pe "kubectl wait --for=condition=ready pod --selector=run=demopod"
pe "kubectl get pods"
NO_WAIT=false
clear

NO_WAIT=true
banner "Exec isn't going to work for the same reasons as before..."
pe "kubectl exec -it demopod -- sh"
NO_WAIT=false

wait
banner "But we can use kubectl debug"
pe "kubectl debug -it demopod --target demopod --image busybox"

clear
banner "kubectl debug does not support --user or --privileged so we need to use a container with that UID as it's default user"
pe "kubectl debug -it demopod --target demopod --image cgr.dev/chainguard/prometheus:latest-dev -- sh"

clear
banner "cdebug supports remote kubernetes pods, and it's a bit simpler to use"
pe "cdebug exec -it pod/demopod/demopod"

banner "cdebug supports --user"
pe "cdebug exec -it -u 65532 pod/demopod/demopod"

banner "cdebug supports --privileged"
pe "cdebug exec -it --privileged pod/demopod/demopod"
