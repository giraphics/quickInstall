# Visual Studio Code — Installation Guide

Scripted installs for Windows (PowerShell), Ubuntu/Debian (bash), and macOS (bash).

---

## Windows

**Option A — Script (recommended)**  
In PowerShell:
```powershell
.\install-windows.ps1
```
Uses **winget** (preferred) or **Chocolatey** if available.

**Option B — Manual**  
Download: https://code.visualstudio.com/Download → run the installer.

---

## Ubuntu / Debian

```bash
chmod +x install-ubuntu.sh
./install-ubuntu.sh
```
Adds Microsoft’s official apt repository and installs the `code` package.  
**Note:** Uses `sudo`; no manual download required.

---

## macOS

```bash
chmod +x install-mac.sh
./install-mac.sh
```
Installs **Homebrew** if missing, then installs VS Code via `brew install --cask visual-studio-code`.

---

## After install

- **Launch:** `code` from terminal, or start “Visual Studio Code” from the OS.
- **CLI:** Ensure `code` is on your PATH (usually set by the installer).
- **Updates:** Use the built-in update flow, or your package manager (`winget upgrade`, `apt upgrade`, `brew upgrade`).

---

## Links

- Download: https://code.visualstudio.com/Download  
- Docs: https://code.visualstudio.com/docs
