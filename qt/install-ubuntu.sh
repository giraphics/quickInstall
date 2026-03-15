#!/bin/bash
# install-ubuntu.sh — Qt 6 (Ubuntu/Debian via apt)
# Usage: sudo ./install-ubuntu.sh

set -e

echo "=== Qt 6 Installer (Ubuntu/Debian) ==="
echo "Note: apt packages may lag behind latest Qt release."
echo "For latest version, see README.md for online installer instructions."

sudo apt-get update
sudo apt-get install -y \
    qt6-base-dev \
    qt6-tools-dev \
    qt6-tools-dev-tools \
    qt6-l10n-tools \
    qt6-documentation-tools \
    libqt6opengl6-dev \
    libqt6svg6-dev \
    libqt6multimedia6 \
    qml6-module-qtquick \
    qtcreator \
    cmake \
    ninja-build

echo ""
echo "=== Qt 6 installed! ==="
echo "Launch Qt Creator with: qtcreator"
qmake6 --version 2>/dev/null || echo "qmake6 not in PATH — check /usr/lib/qt6/bin/"
