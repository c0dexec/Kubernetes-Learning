- Logging, defaulting a container.
	- If multiple containers are present then, `-c` argument to specify a container.
- Restart a deployment using `k rollout restart <name of deployment>`
- `kubectl apply` can be used to apply changes and retain rollout history.
- Run a pod temporarily to execute command with flag `--rm`, `-i` (input), `-t` (interactive shell)
- Good test pods are `nginx:alpine` has `curl`.
- For NetPol,
	- If DNS needs to be allowed by itself on TCP and UDP
```yaml
egres:
- to:
	- podSelector: # All ports are allowed.
		matchLabels:
			id: api 
- ports: # Allows DNS for all pods.
	- protocol: TCP
	  port: 53
	- protocol: UDP
	  port: 53	  
```
- Adding an annotation `kubernetes.io/change-cause: <change note>` using `kubectl annotate`.
- If a _Secret_ belongs to a _ServiceAccount_, it'll have the annotation `kubernetes.io/service-account.name` 
- If a Deployment where an update had been made, first thing to check is `kubectl rollout history`.
- For container security context, In a Pods `.spec.containers.securityContext` the key value pairs are added as `true` or `false`.
	- Container's `securityContext` also support `capabilities` (`spec.containers.securityContext.capabilities).
- When no selector is for PVC, it automatically picks whichever PV is available.
- DNS, `<name of service>.<namespace>.<svc>.<cluster>`
- When working with `pv` and `pvc`, if a `pvc` has to be mount to a specific `pv` then `spec.volumeName` is used in `pvc`.
	- Also `spec.accessModes` should match aswell.
- Switch over namespace by default,
	- `kubectl config set-context $(kubectl config current-context) --namespace=dev`,  creates a context.
		- Sets the default namespace for the current context (`kubectl config current-context`).
- `kubectl set resources`, can be used to set resource limits and requests.
### Remember
- Sidecar containers in K8s are `initContainers` with `restartPolicy: Always`.
### Quick commands
- `--force --grace-period=0` can be added to quickly delete pods.
- Can specify `-n` in the `kubectl create` command to create resources in a specific namespace.
- `k -n [namespace] get rs -o wide | grep [deployment name]`, fastest way to view image being used.
- In VIM, to then indent the marked lines press `>` or `<` and to repeat the action press `.`.
- `-l` can be used to add labels in `kubectl run` command. `-l` in other commands is used as selector.
- `--port` can be used with `kubectl create deployment` or `kubectl run`.
- `kubectl expose` can be used to quickly create a service 
- `kubectl set` can be used to quickly set, `serviecaccount`, `env`, `image`, `resources`, `selector`, `subject`.
# Tricky questions
- If a questions asks to perform migration of just the Pod, then they expect the Pod to be in a running state after migration.
	- This means sections that are not relevant in the new `namespace` need to be removed.
		- `status`
		- `volume`
		- `volumeMount`
		- `nodeName`
## HELM 
### HELM install
- `helm install [release-name] [chart-name]`
- `helm -n mercury install [release-name] [chart-name] --set replicaCount=2 --set image.debug=true`
### Upgrade a Release to newer version of chart
- `helm repo list`, see repo name
- `helm repo update`, updates all repo 
- `helm search repo nginx --versions`, lists all versions of `nginx`
- `helm -n mercury upgrade <releases name> <repo name>`, without specifying `--version` upgrades to the latest.
- `helm -n mercury ls`, lists releases.
### Rollback
- `helm history <release name>`, to see history of a release
- `helm rollback <release name> [revision number]`, to roll back to a specify revision.i
### View values
- `helm show values <chart name>`
	- `helm show values <chart name> | yq -e`, for parsing as YAML.i
### Troubleshooting Pending realeases
- By default releases in `pending-upgrade` state aren't listed, but we can show all to find and delete the broken release:
	- `helm -n [namespace] ls -a`, lists all releases including broken ones
	- `helm -n [namespace] uninstall [release name]`
### `yq`
- Can parse [special characters](https://mikefarah.gitbook.io/yq/v3.x/usage/path-expressions#special-characters) by covering the whole regex in single quotes and then double quotes around the text which contains special characters,
	- `k get secrets -A -o yaml | yq -e '.items[].metadata.annotations."cert-manager.io/alt-names"'`
	  For example, in the text above "cert-manager.io/alt-names" contains special character `/`.i
### `grep`
- `-A` argument can be used to list number of lines after the match
- `-C` argument can be used to list number of lines before and after the match.
### `vim`
- `%retab!` retabs the whole file.
- jump to a line `:<line number>`
# Review
- API Deprecation
- Taints and Tolerations, Node affinity
- Admission controllers,
	- `--enable-admission-plugins`, to enable admission controllers
	- `--disable-admission-plugins`, to disable admission controllers.