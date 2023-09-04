Setting up prometheus

1. Install Helm
	curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
	chmod 700 get_helm.sh
	./get\_helm.sh
2. Add the Prometheus Helm Chart Repository
	helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
	helm repo update
3. Install Prometheus:
	helm install prometheus prometheus-community/prometheus
4. Access Prometheus: kubectl port-forward service/prometheus-server 9090:80
5. Open a browser and navigate to http://localhost:9090/
