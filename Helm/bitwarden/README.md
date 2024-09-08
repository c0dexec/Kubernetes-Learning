# [Requirements](https://github.com/bitwarden/helm-charts/blob/main/charts/self-host/README.md)
- Kubectl
- Helm 3
- SSL cert and key or certificate provider
- SMTP server/account
- Storage Class that supports ReadWriteMany
    - Certain [access modes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#access-modes) support `ReadWriteMany`