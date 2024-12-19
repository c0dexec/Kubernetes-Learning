[KLLR SHLL Tips](https://killer.sh/attendee/e5b09170-ee5b-4b91-bba3-53c92313cba3/tips)
## Terminal Handling

### Bash Aliases

In the real exam, each question has to be solved on a different instance to which you connect via ssh. This means it's not advised to configure bash aliases because they wouldn't be available on the instances accessed by ssh.

### Be fast

Use the `history` command to reuse already entered commands or use even faster history search through **Ctrl r** .

If a command takes some time to execute, like sometimes `kubectl delete pod x`. You can put a task in the background using **Ctrl z** and pull it back into foreground running command `fg`.

You can delete _pods_ fast with:
```
k delete pod x --grace-period 0 --force
```
