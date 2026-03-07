# install-windows.ps1 — Git (Windows)

param(
    [string]$UserName = "",
    [string]$UserEmail = ""
)

Write-Host "=== Git Installer (Windows) ===" -ForegroundColor Cyan

winget install Git.Git --accept-package-agreements --accept-source-agreements

# Refresh PATH
$env:PATH = [System.Environment]::GetEnvironmentVariable("PATH","Machine") + ";" +
            [System.Environment]::GetEnvironmentVariable("PATH","User")

if ($UserName)  { git config --global user.name  "$UserName" }
if ($UserEmail) { git config --global user.email "$UserEmail" }

# Sensible defaults
git config --global core.autocrlf true
git config --global init.defaultBranch main
git config --global pull.rebase false

Write-Host "Git installed!" -ForegroundColor Green
Write-Host "Verify: git --version"
Write-Host ""
Write-Host "Set your identity (if not passed as params):"
Write-Host '  git config --global user.name  "Your Name"'
Write-Host '  git config --global user.email "you@example.com"'
