- Create a service `redis-service` to expose the `redis` application within the cluster on port `6379`.
  Use imperative commands.
	- `kubectl expose pod --name redis-service redis --port 6379`
- Create a pod called `httpd` using the image `httpd:alpine` in the default namespace. Next, create a service of type `ClusterIP` by the same name `(httpd)`. The target port for the service should be `80`.
  *Try to do this with as few steps as possible.*
	- `kubectl run httpd --image httpd:alpine --expose=true --port 80`