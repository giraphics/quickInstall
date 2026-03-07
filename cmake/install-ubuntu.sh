#!/bin/bash
# install-ubuntu.sh — CMake (Ubuntu/Debian)
# Installs latest CMake via Kitware's official apt repository

set -e
echo "=== CMake Installer (Ubuntu/Debian) ==="

sudo apt-get update
sudo apt-get install -y ca-certificates gpg wget

# Add Kitware APT repo for latest CMake
wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | \
    gpg --dearmor - | sudo tee /usr/share/keyrings/kitware-archive-keyring.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu/ $(lsb_release -cs) main" | \
    sudo tee /etc/apt/sources.list.d/kitware.list >/dev/null

sudo apt-get update
sudo apt-get install -y cmake

echo "=== CMake installed! ==="
cmake --version
