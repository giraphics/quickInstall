# install-windows.ps1 — Node.js via nvm-windows (Windows)

Write-Host "=== Node.js + nvm-windows Installer (Windows) ===" -ForegroundColor Cyan

# Install nvm-windows
winget install CoreyButler.NVMforWindows --accept-package-agreements --accept-source-agreements

# Refresh PATH for current session
$env:PATH = [System.Environment]::GetEnvironmentVariable("PATH","Machine") + ";" +
            [System.Environment]::GetEnvironmentVariable("PATH","User")

# Check if nvm is available
if (-not (Get-Command nvm -ErrorAction SilentlyContinue)) {
    Write-Host "nvm is not available in this terminal yet." -ForegroundColor Yellow
    Write-Host "Please close and reopen PowerShell, then run:" -ForegroundColor Yellow
    Write-Host "  nvm install lts"
    Write-Host "  nvm use lts"
    exit 1
}

Write-Host "Installing latest LTS version of Node.js..." -ForegroundColor Yellow
nvm install lts
nvm use lts

Write-Host ""
Write-Host "Node.js installed!" -ForegroundColor Green
node --version
npm --version

Write-Host ""
Write-Host "Quick reference:"
Write-Host "  nvm install 20.11.1   # install a specific Node version"
Write-Host "  nvm use 20.11.1       # switch to that version"
Write-Host "  nvm list              # list installed versions"
Write-Host "  nvm uninstall 20.11.1 # remove a version"