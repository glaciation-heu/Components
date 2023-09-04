1. Set Up Fluentd Using Helm:
a. Add the Fluentd Helm Chart Repository (if you haven't already):
	helm repo add fluent https://fluent.github.io/helm-charts
	helm repo update
b. helm install fluentd fluent/fluentd

2. To view the logs
a. Identify the fluentd pods kubectl get pods -l app=fluentd
b. View logs for a specific pod kubectl logs podname
c. Tail the logs kubectl logs -f podname
