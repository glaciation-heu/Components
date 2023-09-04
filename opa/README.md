Deploy OPA as an Admission Controller:
1. kubectl create namespace opa
2. Deploy OPA kubectl apply -n opa -f https://raw.githubusercontent.com/open-policy-agent/k8s-admission-control/main/manifests/deploy/deploy.yaml
3. Configure Kubernetes API server: --admission-control-config-file=<path-to-config-file>
4. Define Policies: Example here 

package kubernetes.admission

deny[reason] {
  input.request.kind.kind == "Namespace"
  not input.request.object.metadata.labels["owner"]
  reason := "All namespaces must have an owner label."
}

