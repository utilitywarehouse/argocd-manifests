# argocd-manifests

This repository provides Kustomize bases to deploy an instance of
[ArgoCD](https://argoproj.github.io/argo-cd/).

## Usage

The resources are divided into two bases:

- `cluster` - cluster scoped resources
- `namespaced` - namespaced resources

Reference them in your kustomization.yaml, like so:

```yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
bases:
  - github.com/utilitywarehouse/argocd-manifests/cluster?ref=1.6.1-1
  - github.com/utilitywarehouse/argocd-manifests/namespaced?ref=1.6.1-1
```

Refer to the [example](example/).
