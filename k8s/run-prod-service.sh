parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

IMAGE_NAME="exsanik/nest-api"
DOCKERFILE_PATH="../Dockerfile"
BUILD_CONTEXT_PATH=".."

DEPLOYMENT_FILE_PATH="./nest.deployment.yml"
SERVICE_FILE_PATH="./nest.node-port.yml"
NAMESPACE_FILE_PATH="./nest.namespace.yml"

CONTAINER_NAME="nest"
DEPLOYMENT_NAME="nest-deployment"
NAMESPACE_NAME="nest"

eval $(minikube docker-env)

timestamp=$(date +%s)
imageName="${IMAGE_NAME}:ts-${timestamp}"

applyClusterNamespaceCommand="kubectl apply -f ${NAMESPACE_FILE_PATH}"
eval $applyClusterNamespaceCommand

deleteAllDeploymentsInNamespaceCommand="kubectl delete --all pods,deployments,services,replicasets,daemonsets,rc --namespace=${NAMESPACE_NAME} --grace-period=10"
eval $deleteAllDeploymentsInNamespaceCommand

deleteAllTagsOfImageCommand="docker images | grep ${IMAGE_NAME} | tr -s ' ' | cut -d ' ' -f 2 | xargs -I {} docker rmi ${IMAGE_NAME}:{} -f"
eval $deleteAllTagsOfImageCommand

dockerBuildCommand="docker build ${BUILD_CONTEXT_PATH} -f ${DOCKERFILE_PATH} -t ${imageName}"
eval $dockerBuildCommand

applyClusterConfigsCommand="kubectl apply -f ${DEPLOYMENT_FILE_PATH} -f ${SERVICE_FILE_PATH}"
eval $applyClusterConfigsCommand

setNewImageCommand="kubectl set image deployment/${DEPLOYMENT_NAME} ${CONTAINER_NAME}=${imageName} --namespace=${NAMESPACE_NAME}"
eval $setNewImageCommand

showAllPodsCommand="kubectl get pods --namespace=${NAMESPACE_NAME}"
eval $showAllPodsCommand