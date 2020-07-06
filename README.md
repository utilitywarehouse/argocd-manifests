# argocd-manifests

This repository provides Kustomize bases to deploy an instance of
[ArgoCD](https://argoproj.github.io/argo-cd/).

Note: these manifests purposely disable TLS and authentication, with the
assumption being that both of these concerns will be handled by a proxy in front
of the server.

## Usage

The resources are divided into two bases:

- `cluster` - cluster scoped resources
- `namespaced` - namespaced resources

Reference them in your kustomization.yaml, like so:

```yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
bases:
  - github.com/utilitywarehouse/argocd-manifests/cluster?ref=1.6.1-2
  - github.com/utilitywarehouse/argocd-manifests/namespaced?ref=1.6.1-2
```

Refer to the [example](example/).
