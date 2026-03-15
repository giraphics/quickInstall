# Qt Framework — Installation Guide

Qt requires a free **Qt Account** and uses a GUI-based installer. Full scripted installation
is only supported on Linux (Qt Online Installer CLI mode).

---

## Windows & macOS — Manual Steps

1. Create a free Qt Account at https://login.qt.io/register
2. Download the **Qt Online Installer** from https://www.qt.io/download-qt-installer
3. Run the installer and sign in with your Qt Account
4. Select components:
   - ✅ **Qt 6.x** → `MSVC 2022 64-bit` (Windows) / `macOS` (Mac)
   - ✅ Qt Creator IDE
   - ✅ CMake & Ninja (if not already installed)
   - ✅ Qt Debug Information Files (optional but useful)
5. Complete installation (~3–10 GB depending on components)

### Recommended Components for Graphics/AI Development
| Component | Purpose |
|-----------|---------|
| Qt 6.x Core, GUI, Widgets | Base UI |
| Qt Quick / QML | Modern declarative UI |
| Qt Multimedia | Audio/video |
| Qt 3D | 3D graphics |
| Qt Charts | Data visualization |
| Qt WebEngine | Embedded browser |

---

## Ubuntu/Debian — Scripted Install

Run the provided script:
```bash
chmod +x install-ubuntu.sh
sudo ./install-ubuntu.sh
```

This installs Qt via `apt` (may not be the latest version, but is simpler):
```bash
sudo apt-get install -y qt6-base-dev qt6-tools-dev qtcreator cmake
```

For the latest Qt on Ubuntu, use the online installer CLI:
```bash
./qt-unified-linux-x64-online.run \
  --accept-licenses \
  --default-answer \
  --confirm-command \
  install qt.qt6.680.gcc_64
```

---

## Environment Variables (after install)

```bash
# Linux / macOS — add to ~/.bashrc or ~/.zshrc
export Qt6_DIR=/opt/Qt/6.8.0/gcc_64/lib/cmake/Qt6
export PATH=/opt/Qt/6.8.0/gcc_64/bin:$PATH

# Windows — add to System Environment Variables
Qt6_DIR=C:\Qt\6.8.0\msvc2022_64\lib\cmake\Qt6
```

---

## Useful Links
- Qt Downloads: https://www.qt.io/download
- Qt Documentation: https://doc.qt.io
- Qt for beginners: https://doc.qt.io/qt-6/gettingstarted.html
