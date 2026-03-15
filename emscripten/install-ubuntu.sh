#!/bin/bash
# install-ubuntu.sh — Emscripten SDK (Ubuntu/Debian)
# Usage: ./install-ubuntu.sh

set -e

INSTALL_DIR="$HOME/emsdk"

echo "=== Emscripten SDK Installer (Ubuntu/Debian) ==="

# Detect Ubuntu version
UBUNTU_VERSION=$(lsb_release -rs)
CODENAME=$(lsb_release -cs)
echo "Detected Ubuntu $UBUNTU_VERSION ($CODENAME)"

# Install dependencies
echo "Installing dependencies (git, python3, cmake)..."
sudo apt-get update
sudo apt-get install -y git python3 python3-pip cmake

# Clone or update emsdk
if [ -d "$INSTALL_DIR/.git" ]; then
    echo "emsdk already cloned — pulling latest..."
    git -C "$INSTALL_DIR" pull
else
    echo "Cloning emsdk to $INSTALL_DIR ..."
    git clone https://github.com/emscripten-core/emsdk.git "$INSTALL_DIR"
fi

# Install and activate the latest SDK
cd "$INSTALL_DIR"

echo "Installing latest Emscripten..."
./emsdk install latest

echo "Activating latest Emscripten..."
./emsdk activate latest

echo ""
echo "=== Emscripten SDK installed successfully! ==="
echo ""
echo "=== HOW TO ACTIVATE (run each new terminal session) ==="
echo "  source $INSTALL_DIR/emsdk_env.sh"
echo ""
echo "  To activate automatically, add this line to your ~/.bashrc:"
echo '  source ~/emsdk/emsdk_env.sh'
echo ""
echo "  Apply immediately to this session:"
echo "  source ~/.bashrc"
echo ""
echo "Quick reference (after activating):"
echo "  Verify install:   emcc --version"
echo "  Compile a file:   emcc hello.c -o hello.html"
echo "  Build with CMake: emcmake cmake .. && emmake make"
