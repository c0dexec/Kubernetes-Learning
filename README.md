# Upgrading Kubernetes cluster and its components in Kubespray
- First, check the [upgrades.md](https://github.com/kubernetes-sigs/kubespray/blob/master/docs/operations/upgrades.md) documentation on guidlines and steps to perform the upgrade.
- Also check the latest [Kubespray releases](https://github.com/kubernetes-sigs/kubespray/releases) to findout the version of Kubernetes that are available for the upgrade. 
- Then perform the upgrade using ansible.
```bash
ansible-playbook upgrade-cluster.yml -b -i inventory/mycluster/hosts.yaml -e kube_version=v1.30.4 -e upgrade_cluster_setup=true
```
