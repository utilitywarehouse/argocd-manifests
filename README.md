**NOTE:** archived since we are not using argo anymore and the setup is getting outdated


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
  - github.com/utilitywarehouse/argocd-manifests/cluster?ref=1.6.1-3
  - github.com/utilitywarehouse/argocd-manifests/namespaced?ref=1.6.1-3
```

Refer to the [example](example/).

## Update

The upstream kustomize manifests are vendored in this repository to improve `kustomize build` times.

Run this make target to update the manifests from the upstream. It may take a
few minutes:

```
$ make update v1.6.1
```
