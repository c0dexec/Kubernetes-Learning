If we have to edit existing POD:
- If you have a pod definition file then edit the file.
- If pod definition file is not provided, one can extract it. Then edit the pod definitions.
	`kubectl get pod <pod-name> -o yaml > pod-definition.yaml`
- To modify properties of a pod utilize `kubectl edit pod <pod-name>`.
	- Only the following are editable
		- spec.containers[*].image
		- spec.initContainers[*].image
		- spec.activeDeadlineSeconds
		- spec.tolerations
		- spec.terminationGracePeriodSeconds
- If changes are made to anything other than the listed above, the changes are not applied but the YAML is saved in as a temporary file within `/tmp/` directory.
	- Then older Pods can be deleted and newer one can be spun up with the newer pod definition file.
	- Even `kubectl replace` can be used to replace the Pods with the modified values.