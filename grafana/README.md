Steps I followed to install grafana

1.  Add the Grafana Helm Chart Repository
	helm repo add grafana https://grafana.github.io/helm-charts
	helm repo update
2. Install Grafana:
	helm install grafana grafana/grafana

1. Get your 'admin' user password by running:

   kubectl get secret --namespace workload-namespace grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo


2. The Grafana server can be accessed via port 80 on the following DNS name from within your cluster:

   grafana.workload-namespace.svc.cluster.local

   Get the Grafana URL to visit by running these commands in the same shell:
     export POD_NAME=$(kubectl get pods --namespace workload-namespace -l "app.kubernetes.io/name=grafana,app.kubernetes.io/instance=grafana" -o jsonpath="{.items[0].metadata.name}")
     kubectl --namespace workload-namespace port-forward $POD_NAME 3000

3. Login with the password from step 1 and the username: admin

TODO - Connect Grafana to Prometheus
