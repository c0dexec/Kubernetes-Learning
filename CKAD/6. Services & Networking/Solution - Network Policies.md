- Create a network policy to allow traffic from the Internal application only to the payroll-service and db-service.

	Use the spec given below. You might want to enable ingress traffic to the pod to test your rules in the UI.

	Also, ensure that you allow egress traffic to DNS ports TCP and UDP (port 53) to enable DNS resolution from the internal pod.
Keep in mind when creating Policies for multiple services, split the rules if possible. When specifying `nodeSelector` or `namespaceSelector` ensure that similar "key" are separate entries.
```yaml
spec:
  podSelector:
    matchLabels:
	  name: internal
  policyTypes:
    - Egress
  egress:
    - ports:
        - port: 8080
          protocol: TCP
      to:
        - podSelector:
            matchLabels:
              name: payroll
    - ports:
      - port: 3306
        protocol: TCP
      to:
        - podSelector:
            matchLabels:
              name: mysql
    - ports:
      - port: 53
        protocol: TCP
      - port: 53
        protocol: UDP                      
```
