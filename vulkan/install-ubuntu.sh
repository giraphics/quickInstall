#!/bin/bash
# install-ubuntu.sh — Vulkan SDK (Ubuntu/Debian)
# Usage: sudo ./install-ubuntu.sh

set -e

echo "=== Vulkan SDK Installer (Ubuntu/Debian) ==="

# Detect Ubuntu version
UBUNTU_VERSION=$(lsb_release -rs)
CODENAME=$(lsb_release -cs)
echo "Detected Ubuntu $UBUNTU_VERSION ($CODENAME)"

# Add LunarG repository
echo "Adding LunarG Vulkan SDK repository..."
wget -qO- https://packages.lunarg.com/lunarg-signing-key-pub.asc | sudo tee /etc/apt/trusted.gpg.d/lunarg.asc > /dev/null
sudo wget -qO /etc/apt/sources.list.d/lunarg-vulkan-$CODENAME.list \
    https://packages.lunarg.com/vulkan/lunarg-vulkan-$CODENAME.list

# Install
sudo apt-get update
sudo apt-get install -y vulkan-sdk

echo ""
echo "=== Vulkan SDK installed successfully! ==="
echo "Verify with: vulkaninfo"
echo "Validation layers: vulkan-validationlayers"
