# KServe - EKS Bootstrap

[Back](../README.md)

- [KServe - EKS Bootstrap](#kserve---eks-bootstrap)
  - [Infra](#infra)
  - [Argo CD](#argo-cd)

---

## Infra

```sh
terraform -chdir=infra init -backend-config=backend.hcl
terraform -chdir=infra fmt && terraform -chdir=infra validate

terraform -chdir=infra plan
terraform -chdir=infra apply -auto-approve

terraform -chdir=infra destroy

kubectl get node
# NAME                          STATUS   ROLES    AGE     VERSION
# ip-10-0-14-240.ec2.internal   Ready    <none>   2m15s   v1.36.2-eks-bca9cf6
# ip-10-0-20-22.ec2.internal    Ready    <none>   2m12s   v1.36.2-eks-bca9cf6

```

---

## Argo CD

```sh
aws eks update-kubeconfig --region us-east-1 --name kserve-dev
# Added new context arn:aws:eks:us-east-1:099139718958:cluster/kserve-dev to /home/ubuntuadmin/.kube/config

helm list -n argocd
# NAME    NAMESPACE       REVISION        UPDATED                                 STATUS          CHART           APP VERSION
# argocd  argocd          1               2026-07-27 13:47:04.2911697 -0400 EDT   deployed        argo-cd-10.2.1  v3.4.5 

kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

kubectl -n argocd port-forward svc/argocd-server 8000:443

# app-of-apps
kubectl apply -f argocd/00-root.yaml

```