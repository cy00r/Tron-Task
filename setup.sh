#!/bin/bash

# Exit script on any error
set -e

echo "Starting TRON Private Node Setup..."

# 1. Create a 4GB Swap File (Required for Java-Tron on 1GB RAM Free-Tier instances)
echo "Configuring 4GB swap space..."
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

# Make swap permanent across reboots
if ! grep -q '/swapfile' /etc/fstab; then
  echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
fi

# 2. Update System and Install Docker
echo "Updating packages and installing Docker..."
sudo apt-get update
sudo apt-get install -y docker.io curl jq

# Enable and start Docker service
sudo systemctl enable --now docker

# 3. Deploy TRON Quickstart Node
echo "Deploying TRON Quickstart Docker container..."
sudo docker run -d \
  -p 9090:9090 \
  --name tron-private-net \
  --restart always \
  -e "defaultBalance=100000" \
  trontools/quickstart

echo "Setup complete! The TRON private node is spinning up."
echo "Wait 30-60 seconds, then test the RPC using:"
echo "curl -X POST http://localhost:9090/wallet/getnowblock"
