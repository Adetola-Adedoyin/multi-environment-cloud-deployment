#!/bin/bash
set -e

echo "=== Phase 3: Setting up Kubernetes Cluster ==="

# Apply ArgoCD
kubectl apply -f gitops/k8s-manifests/argocd/argocd-install.yaml

# Apply Ingress Controller
kubectl apply -f gitops/k8s-manifests/ingress/nginx-ingress.yaml

# Apply Security Policies
kubectl apply -f gitops/k8s-manifests/security/network-policies.yaml
kubectl apply -f gitops/k8s-manifests/security/gatekeeper.yaml

# Apply Vault CSI
kubectl apply -f vault/k8s/vault-csi.yaml

# Apply Velero Backup
kubectl apply -f gitops/k8s-manifests/backup/velero.yaml

# Wait for ArgoCD to be ready
echo "Waiting for ArgoCD to be ready..."
kubectl wait --for=condition=available --timeout=300s deployment/argocd-server -n argocd

# Get ArgoCD admin password
ARGOCD_PASSWORD=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)

echo "Kubernetes cluster setup completed!"
echo "ArgoCD admin password: $ARGOCD_PASSWORD"
echo "Access ArgoCD at: https://argocd.production.local"