

```sh
# install cert-manager
helm install \
  cert-manager oci://quay.io/jetstack/charts/cert-manager \
  --version v1.21.0 \
  --namespace cert-manager \
  --create-namespace \
  --set crds.enabled=true


# Install CRDs
helm install kserve-crd oci://ghcr.io/kserve/charts/kserve-crd \
  --version v0.18.0 \
  --namespace kserve \
  --create-namespace

# Install KServe Resources: Standard Mode
helm install kserve-resources oci://ghcr.io/kserve/charts/kserve-resources \
  --version v0.18.0 \
  --namespace kserve \
  --set kserve.controller.deploymentMode=Standard \
  --wait

# confirm
kubectl get po -n kserve
# NAME                                         READY   STATUS    RESTARTS   AGE
# kserve-controller-manager-676dbc7ff9-mgsld   2/2     Running   0          51s

```

## Download LLM

```sh
# linux
curl -LsSf https://hf.co/cli/install.sh | bash

# windows
powershell -ExecutionPolicy ByPass -c "irm https://hf.co/cli/install.ps1 | iex"

# confirm
hf --version
# 1.24.0

hf models info               

hf download meta-llama/Llama-3.2-1B-Instruct --local-dir ./models/llama       

```