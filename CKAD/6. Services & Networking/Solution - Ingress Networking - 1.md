- `/pay` URL endpoint doesn't exist in the application. Instead its `/`.
	- After inspecting the Pod logs you can see this to be true.
	- `rewrite-target` is then used, 
		- `nginx.ingress.kubernetes.io/rewrite-target: /`
		- When `/pay` path is used, it gets rewritten to `/` which is present at the application Pod.
```logs
10.244.0.9 - - [20/Sep/2024 22:05:58] "GET /pay HTTP/1.1" 404 -
10.244.0.9 - - [20/Sep/2024 22:09:33] "GET / HTTP/1.1" 200 -
```
	
- And the path remains the same `path: /pay`