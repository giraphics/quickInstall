#!/bin/bash
# install-ubuntu.sh — Visual Studio Code (Ubuntu/Debian)
# Installs from Microsoft's official apt repository

set -e
echo "=== VS Code Installer (Ubuntu/Debian) ==="

sudo apt-get update
sudo apt-get install -y wget gpg apt-transport-https

# Import Microsoft GPG key (modern keyrings path)
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /usr/share/keyrings/packages.microsoft.gpg >/dev/null
echo "deb [arch=amd64,arm64,armhf signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | \
    sudo tee /etc/apt/sources.list.d/vscode.list >/dev/null

sudo apt-get update
sudo apt-get install -y code

echo "=== VS Code installed! ==="
code --version 2>/dev/null || echo "Launch with: code"
