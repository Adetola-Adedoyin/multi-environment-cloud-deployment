#!/bin/bash
set -e

echo "=== Phase 1: Deploying Infrastructure ==="

# Initialize Terraform
cd infrastructure/environments/prod
terraform init

# Plan infrastructure changes
terraform plan -out=tfplan

# Apply infrastructure
terraform apply tfplan

# Save outputs
terraform output -json > ../../../outputs/infrastructure-outputs.json

echo "Infrastructure deployment completed successfully!"
echo "Management IPs: $(terraform output -json management_ips)"
echo "K8s Master IPs: $(terraform output -json k8s_master_ips)"
echo "K8s Worker IPs: $(terraform output -json k8s_worker_ips)"