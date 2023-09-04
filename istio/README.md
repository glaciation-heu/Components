Should be able to simply run setup\_istio\_demo.sh

Steps I followed to install istio

1. curl -L https://istio.io/downloadIstio | sh -

2. Add to my execution path by running this command export PATH="$PATH:/home/aidan/Components/istio/istio-1.18.2/bin"

3. Installed Istio by running this command kubectl label namespace default istio-injection=enabled

4. Enabled automatic sidecar injection by running this command kubectl label namespace default istio-injection=enabled

5. Demos are in istio-1.18.2/samples
