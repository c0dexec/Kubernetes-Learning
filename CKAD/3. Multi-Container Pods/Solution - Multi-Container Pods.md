- The application outputs logs to the file `/log/app.log`. View the logs and try to identify the user having issues with Login.
- First, view the logs using `kubectl exec -n elastic-stack pods/app -c 'app' -- cat /log/app.log`
- Added the Sidecar logging container
```yaml
  - name: sidecar
    image: kodekloud/filebeat-configured
    volumeMounts:
      - name: log-volume
        mountPath: /var/log/event-simulator/
```