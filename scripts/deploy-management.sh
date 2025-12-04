#!/bin/bash
set -e

echo "=== Phase 2: Deploying Management Plane ==="

# Deploy management applications
cd applications/management
docker-compose up -d

# Wait for services to be ready
echo "Waiting for services to start..."
sleep 60

# Verify services
curl -f http://localhost:80 || echo "Rancher not ready"
curl -f http://localhost:8080 || echo "GitLab not ready"
curl -f http://localhost:8200/v1/sys/health || echo "Vault not ready"
curl -f http://localhost:9090 || echo "Prometheus not ready"
curl -f http://localhost:3000 || echo "Grafana not ready"

echo "Management plane deployment completed!"
echo "Access URLs:"
echo "- Rancher: http://management-ip"
echo "- GitLab: http://management-ip:8080"
echo "- Harbor: http://management-ip:8081"
echo "- Vault: http://management-ip:8200"
echo "- Prometheus: http://management-ip:9090"
echo "- Grafana: http://management-ip:3000"