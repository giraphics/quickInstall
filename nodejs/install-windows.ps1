# install-windows.ps1 — Node.js via fnm (Windows)
# fnm = Fast Node Manager, similar to nvm

Write-Host "=== Node.js + fnm Installer (Windows) ===" -ForegroundColor Cyan

# Install fnm
winget install Schniz.fnm --accept-package-agreements --accept-source-agreements

# Add fnm to current session
$env:PATH += ";$env:APPDATA\fnm"
fnm env --use-on-cd | Out-String | Invoke-Expression

# Install LTS Node
fnm install --lts
fnm use lts-latest
fnm default lts-latest

Write-Host "Node.js installed!" -ForegroundColor Green
node --version
npm --version

Write-Host ""
Write-Host "Quick reference:"
Write-Host "  fnm install 20     # install Node 20"
Write-Host "  fnm use 20         # switch to Node 20"
Write-Host "  fnm list           # list installed versions"
