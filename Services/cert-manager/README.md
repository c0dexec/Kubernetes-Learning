# Things to remember
- LetsEncrypt Prod are the ones which are trsuted by browser which is the expected behaviour, staging is not. [1](#references) 

## Issuer vs ClusterIssuer
- Issuers is a namespace resource where as ClusterIssuer can be use in mutiple namespaces within a cluster. [2](#references)

# ACME
DNS01 solvers are the only ones capable of registering subdomains (*.example.com). HTTP01 are limited to only registering domains.

## Solving Challenges
DNS01 challenges are performed by presenting a DNS TXT record. Then the ACME server can retrieve this key over the internet via a DNS lookup to validate the owner of the domain for the requested certificate.[3]

When HTTP01 challenge is created cert-manager automatically configures the cluster ingress to route traffic to the URL which hosts a small webserver with the key. This key is used to validate you as the owner of the domain by accessing URL over the internet. Then the certificate is generated.

## Using Mutiple Solver Types
- Good read on mutiple solver types can be found in the [documentation](https://cert-manager.io/docs/configuration/acme/#adding-multiple-solver-types).

# References
1. https://cert-manager.io/docs/tutorials/acme/nginx-ingress/#step-6---configure-a-lets-encrypt-issuer
2. https://cert-manager.io/docs/concepts/issuer/#namespaces
3. https://cert-manager.io/docs/configuration/acme/#:~:text=HTTP01%20challenges%20are,presents%20this%0Akey.