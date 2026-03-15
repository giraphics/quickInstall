#!/bin/bash
# install-ubuntu.sh — CUDA Toolkit (Ubuntu)
# Requires: NVIDIA GPU + compatible drivers already installed
# Usage: sudo ./install-ubuntu.sh [cuda-version]  e.g. 12-4

set -e

CUDA_VERSION="${1:-12-4}"
UBUNTU_VERSION=$(lsb_release -rs | tr -d '.')
echo "=== CUDA $CUDA_VERSION Installer (Ubuntu $UBUNTU_VERSION) ==="

# Check for NVIDIA GPU
if ! lspci | grep -i nvidia &>/dev/null; then
    echo "WARNING: No NVIDIA GPU detected. Proceeding anyway..."
fi

# Install CUDA keyring
KEYRING_DEB="cuda-keyring_1.1-1_all.deb"
wget -q "https://developer.download.nvidia.com/compute/cuda/repos/ubuntu${UBUNTU_VERSION}/x86_64/${KEYRING_DEB}"
sudo dpkg -i "$KEYRING_DEB"
rm "$KEYRING_DEB"

sudo apt-get update
sudo apt-get install -y "cuda-toolkit-${CUDA_VERSION}"

# Set up environment
CUDA_PATH_LINE='export PATH=/usr/local/cuda/bin:$PATH'
CUDA_LIB_LINE='export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH'

for RC in ~/.bashrc ~/.zshrc; do
    [ -f "$RC" ] || continue
    grep -qxF "$CUDA_PATH_LINE" "$RC" || echo "$CUDA_PATH_LINE" >> "$RC"
    grep -qxF "$CUDA_LIB_LINE"  "$RC" || echo "$CUDA_LIB_LINE"  >> "$RC"
done

export PATH=/usr/local/cuda/bin:$PATH

echo ""
echo "=== CUDA installed! ==="
nvcc --version 2>/dev/null || echo "Restart terminal and run: nvcc --version"
echo ""
echo "See README.md for cuDNN installation instructions."
