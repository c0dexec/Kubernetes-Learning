Authroization Modes,
- `k describe pods -n kube-system kube-apiserver-controlplane`
- `cat /etc/kubernetes/manifests/kube-apiserver.yaml`
- `ps -aux | grep authorization`
Roles and RoleBinding,
- Create Role, `k create role developer --verb=create,delete,list --resource=pods --namespace default --dry-run=client -o yaml > developer.yaml`
- Create RoleBinding, `k create rolebinding dev-user-binding --role=developer --user=dev-user --dry-run=client -o yaml > rolebinding.yaml`
Fix role,
- `k edit role -n blue developer`
- `k get pods -n blue dark-blue-app --as dev-user`, check if issue is fixed.

> Note: `k create role` can specify API Groups through `--resource` argument. For example, to specify `Deployments` resource from `apps` API Group, it would be `--resource=deployments.apps`

Understand Kube Proxy