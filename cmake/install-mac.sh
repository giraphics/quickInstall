#!/bin/bash
# install-mac.sh — CMake (macOS)

set -e
echo "=== CMake Installer (macOS) ==="

if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew install cmake

echo "=== CMake installed! ==="
cmake --version
