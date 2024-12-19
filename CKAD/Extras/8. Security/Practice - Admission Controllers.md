 What is not a admission controller's function?
 - Authentication (I think this is wrong)
Which one of the admission plugins are enabled by default?\
- Used `kube-apiserver -h | grep enable-admission-plugins` to determine which one from the list are enabled by default.
Which is enabled currently which is disabled otherwise?
- `ps -aux | grep enabled-admission-plugins` or `k describe -n kube-system pods kube-apiserver-controlplane` or `cat vim /etc/kubernetes/manifests/kube-apiserver.yaml | grep enabled-admission-plugins`
