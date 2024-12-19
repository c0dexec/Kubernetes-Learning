## Kubectl
- `kubectl explain` can be used to see/find API version for resources.
	- Can also be used to see specific fields. `kubectl explain pods.spec.containers.envFrom.secretRef`
- In a definition file `type` property field is case sensitive. 

[kubectl Quick Reference | Kubernetes](https://kubernetes.io/docs/reference/kubectl/quick-reference/) [Command line tool (kubectl) | Kubernetes](https://kubernetes.io/docs/reference/kubectl/)

[Tool](https://www.bairesdev.com/tools/json2yaml/) can be used to understand YAML format.

---
When `k get pods` is used, all results are parsed as a list, to get fields from the pods, digging down is required. For example to get images, `k get pods -o jsonpath='{.items[*].spec.containers[].image}'`
