Create a new Deployment with the below attributes using your own deployment definition file.

Name: `httpd-frontend`;  
Replicas: `3`;  
Image: `httpd:2.4-alpine`

- `kubectl create deployment --image httpd:2.4-alpine --replicas 3 httpd-frontend`
