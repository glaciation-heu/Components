#!/bin/bash

# Exit on any error
set -e

# Download and extract Istio
echo "Downloading Istio..."
curl -L https://istio.io/downloadIstio | sh -
ISTIO_DIR=$(ls -d */ | grep istio-)
cd $ISTIO_DIR

# Add istioctl to PATH
export PATH=$PWD/bin:$PATH

# Install Istio with the demo profile
echo "Installing Istio with demo profile..."
istioctl install --set profile=demo -y

# Enable automatic sidecar injection for the workload-namespace namespace
echo "Enabling Istio sidecar injection for the workload-namespace namespace..."
kubectl label namespace workload-namespace istio-injection=enabled

# Deploy the Bookinfo sample application
echo "Deploying Bookinfo sample application..."
kubectl apply -f samples/bookinfo/platform/kube/bookinfo.yaml -n workload-namespace

# Wait for the deployments to be ready
echo "Waiting for Bookinfo deployments to be ready..."
kubectl wait --namespace workload-namespace \
  --for=condition=ready pod \
  --selector=app=details \
  --timeout=300s
kubectl wait --namespace workload-namespace \
  --for=condition=ready pod \
  --selector=app=ratings \
  --timeout=300s
kubectl wait --namespace workload-namespace \
  --for=condition=ready pod \
  --selector=app=reviews,version=v1 \
  --timeout=300s
kubectl wait --namespace workload-namespace \
  --for=condition=ready pod \
  --selector=app=reviews,version=v2 \
  --timeout=300s
kubectl wait --namespace workload-namespace \
  --for=condition=ready pod \
  --selector=app=reviews,version=v3 \
  --timeout=300s
kubectl wait --namespace workload-namespace \
  --for=condition=ready pod \
  --selector=app=productpage \
  --timeout=300s

# Set up the Istio Gateway for the Bookinfo app
echo "Setting up Istio Gateway for Bookinfo..."
kubectl apply -f samples/bookinfo/networking/bookinfo-gateway.yaml

echo "Istio demo setup complete!"
echo "You can determine the ingress IP and port to access the Bookinfo product page."

