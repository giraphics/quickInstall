#!/bin/bash
# install-mac.sh — Vulkan SDK (macOS via MoltenVK)
# Usage: ./install-mac.sh

set -e

echo "=== Vulkan SDK Installer (macOS) ==="
echo "Note: macOS uses MoltenVK — Vulkan on top of Metal."

# Check for Homebrew
if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Installing Vulkan SDK via Homebrew..."
brew install vulkan-headers molten-vk vulkan-loader vulkan-tools

echo ""
echo "=== Vulkan SDK installed successfully! ==="
echo "MoltenVK path: $(brew --prefix)/lib/libMoltenVK.dylib"
echo "Verify with:   vulkaninfo"
echo ""
echo "For full SDK (with validation layers), download from:"
echo "  https://vulkan.lunarg.com/sdk/home#mac"
