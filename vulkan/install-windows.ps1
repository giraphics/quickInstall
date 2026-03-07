# install-windows.ps1 — Vulkan SDK (Windows)
# Run as Administrator in PowerShell:
#   Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
#   .\install-windows.ps1

param(
    [string]$VulkanVersion = "latest"
)

Write-Host "=== Vulkan SDK Installer (Windows) ===" -ForegroundColor Cyan

# Check for winget
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Error "winget not found. Install App Installer from the Microsoft Store first."
    exit 1
}

Write-Host "Installing Vulkan SDK via winget..." -ForegroundColor Yellow
winget install KhronosGroup.VulkanSDK --accept-package-agreements --accept-source-agreements

if ($LASTEXITCODE -eq 0) {
    Write-Host "Vulkan SDK installed successfully!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor Cyan
    Write-Host "  1. Restart your terminal/IDE to pick up new environment variables"
    Write-Host "  2. Verify install: vulkaninfo"
    Write-Host "  3. VULKAN_SDK env var should point to the install directory"
} else {
    Write-Error "Installation failed. Try downloading manually from: https://vulkan.lunarg.com/sdk/home"
}
