SHELL := /bin/bash

# Hack to take arguments from command line
# Usage: `make update v1.6.2`
# https://stackoverflow.com/questions/6273608/how-to-pass-argument-to-makefile-from-command-line
update:
	@sed -ri 's#v[0-9]+\.[0-9]+\.[0-9]+#$(filter-out $@,$(MAKECMDGOALS))#g' namespaced/kustomization.yaml
	@kustomize build github.com/argoproj/argo-cd//manifests/cluster-rbac?ref=$(filter-out $@,$(MAKECMDGOALS)) > cluster/upstream/argocd-rbac.yaml
	@kustomize build github.com/argoproj/argo-cd//manifests/crds?ref=$(filter-out $@,$(MAKECMDGOALS)) > cluster/upstream/argocd-crds.yaml
	@kustomize build github.com/argoproj/argo-cd//manifests/base/application-controller?ref=$(filter-out $@,$(MAKECMDGOALS)) > namespaced/upstream/argocd-application-controller.yaml
	@kustomize build github.com/argoproj/argo-cd//manifests/base/config?ref=$(filter-out $@,$(MAKECMDGOALS)) > namespaced/upstream/argocd-config.yaml
	@kustomize build github.com/argoproj/argo-cd//manifests/base/redis?ref=$(filter-out $@,$(MAKECMDGOALS)) > namespaced/upstream/argocd-redis.yaml
	@kustomize build github.com/argoproj/argo-cd//manifests/base/repo-server?ref=$(filter-out $@,$(MAKECMDGOALS)) > namespaced/upstream/argocd-repo-server.yaml
	@kustomize build github.com/argoproj/argo-cd//manifests/base/server?ref=$(filter-out $@,$(MAKECMDGOALS)) > namespaced/upstream/argocd-server.yaml

%:		# matches any task name
	@:	# empty recipe = do nothing
