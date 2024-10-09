#!/bin/bash

# Step 1: Update package database and install prerequisites
sudo apt-get update
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Step 2: Add Docker’s official GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Step 3: Add Docker's official repository for Kali (based on Debian)
echo \
  "deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian bullseye stable
" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Step 4: Install Docker Engine
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Step 5: Start Docker service and enable it to start at boot
sudo systemctl start docker
sudo systemctl enable docker

# Verify Docker installation
sudo docker --version

echo "Docker installation complete!"
