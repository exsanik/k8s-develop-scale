# to monitor
# kubectl get hpa --namespace=nest --watch

NODEPORT='31515'
ENDPOINT='/api?number=123456789'

minikubeIp=$(minikube ip)

outOfResourceCommand="kubectl run -i --tty load-generator --rm --image=busybox --restart=Never -- /bin/sh -c 'while sleep 0.01; do wget -q -O- http://${minikubeIp}:${NODEPORT}${ENDPOINT}; done'"
eval $outOfResourceCommand