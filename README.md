## k8s develop and scale

## Done:
1. Сервіс та докерфайл, або посилання на репозиторій з файлом-образом, з інструкцією як запускати -
   - `docker-compose up --build (runs development version)` 
   - `docker build . -f ./Dockerfile (runs production version)`
2. Скрипти YAML для завантаження в Kubernetes
   - `k8s/nest.namespace.yml`
   - `k8s/nest.deployment.yml`
   - `k8s/nest.node-port.yml`
3. Bash скрипт, який інсталює сервіс в MiniKube автоматично
   - `k8s/run-prod-service.sh`
4. Kubernetes Readiness check + Liveness check
   - `k8s/nest.deployment.yml`
5. Bash скрипт для локального деплою в minikube (без хмарного реєстру контейнерів)
   - `skaffold.yml`
   - `npm run k8s:dev`
   - done via https://skaffold.dev 
6. Додати граничні розміри (quotes) на використання  CPU і пам'яті для подів 
   - `k8s/nest.deployment.yml`
7. Баш скрипт для симуляції ситуації 'out-of-resources'
   - `k8s/out-of-resource-test.sh`
8. Autoscaling
   - `k8s/nest.autoscaler.yml`
