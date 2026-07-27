# KServe - EKS Bootstrap

[Back](../README.md)

- [KServe - EKS Bootstrap](#kserve---eks-bootstrap)
  - [Infra](#infra)

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
