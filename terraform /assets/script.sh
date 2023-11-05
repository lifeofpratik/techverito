#! /bin/bash

set -o errexit
set -o nounset

# Update the package list and upgrade existing packages
sudo apt-get update
sudo apt-get upgrade -y

# Install Docker (if not already installed)
if ! command -v docker &> /dev/null; then
  curl -fsSL https://get.docker.com -o get-docker.sh
  sudo sh get-docker.sh
  sudo usermod -aG docker devopsuser
  sudo rm get-docker.sh
fi

# Install Docker Compose (if not already installed)
if ! command -v docker-compose &> /dev/null; then
  sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
fi

# Create a directory for your application
mkdir -p ~/myapp
cd ~/myapp

# Clone your application's repository from GitHub (replace with your repo URL)
git clone "https://github.com/lifeofpratik/techverito.git"

# Build and run your application using Docker Compose
cd techverito
docker-compose up -d

EOF
