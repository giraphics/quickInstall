#!/bin/bash
# install-mac.sh — Emscripten SDK (macOS)
# Usage: ./install-mac.sh

set -e

INSTALL_DIR="$HOME/emsdk"

echo "=== Emscripten SDK Installer (macOS) ==="

# Check for Homebrew
if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Ensure dependencies are available
echo "Checking dependencies (git, python3)..."
brew list git &>/dev/null || brew install git
brew list python3 &>/dev/null || brew install python3

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
echo "  To activate automatically, add this line to your shell profile:"
echo "  ~/.zshrc  (zsh)  or  ~/.bashrc  (bash):"
echo '  source ~/emsdk/emsdk_env.sh'
echo ""
echo "Quick reference (after activating):"
echo "  Verify install:   emcc --version"
echo "  Compile a file:   emcc hello.c -o hello.html"
echo "  Build with CMake: emcmake cmake .. && emmake make"
