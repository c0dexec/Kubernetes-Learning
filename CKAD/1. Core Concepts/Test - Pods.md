1. Create a new Pods with `nginx` image.
`kubectl run nginx --image=nginx`
5. Which nodes are these pods running on?
Can execute `kubectl describe` or use `kubectl get pods -o wide`(quick).
6. How many containers are part of the pod `webapp`?
Can execute `kubectl get pods`(under `READY` column) to look at containers running in a pod. In depth `kubectl describe pod nginx`
7. Create a new pod with the name `redis` and with the image `redis123`
   Use a pod-definition YAML file.
Can use `kubectl run redis --image=redis123 --dry-run=client -o yaml > redis-pod.yaml`. To extract definition file.
8. Change image of pod `redis`
Can use either `kubectl edit` or if pod-definition YAML exists change `image` in it.