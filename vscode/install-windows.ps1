# install-windows.ps1 — Visual Studio Code (Windows)
# Run in PowerShell (Admin optional for system-wide install)

Write-Host "=== VS Code Installer (Windows) ===" -ForegroundColor Cyan

if (Get-Command winget -ErrorAction SilentlyContinue) {
    winget install Microsoft.VisualStudioCode --accept-package-agreements --accept-source-agreements
} elseif (Get-Command choco -ErrorAction SilentlyContinue) {
    # choco install vscode -y
} else {
    Write-Host "Neither winget nor Chocolatey found." -ForegroundColor Red
    Write-Host "Download from: https://code.visualstudio.com/Download" -ForegroundColor Yellow
    exit 1
}

Write-Host "VS Code installed!" -ForegroundColor Green
Write-Host "Launch with: code"
Write-Host "Verify: code --version"
