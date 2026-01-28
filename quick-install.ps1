# SEO Monster - Quick Install Script
# Этот скрипт загружает и запускает основной установщик

$ErrorActionPreference = 'Stop'

Write-Host @"

╔═══════════════════════════════════════════════════════════╗
║   🦖 SEO Monster - Quick Installer                        ║
╚═══════════════════════════════════════════════════════════╝

"@ -ForegroundColor Cyan

# Проверка прав администратора
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Host "[!] Рекомендуется запустить от имени администратора" -ForegroundColor Yellow
    Write-Host "    для автоматической установки зависимостей." -ForegroundColor Yellow
    Write-Host ""
}

Write-Host "Загрузка установщика..." -ForegroundColor Blue

try {
    # Загружаем основной установщик
    $installerUrl = "https://raw.githubusercontent.com/burtyuo9/seo-monster-windows-installer/main/install.ps1"
    $installerScript = (Invoke-WebRequest -Uri $installerUrl -UseBasicParsing).Content
    
    # Выполняем установщик
    Invoke-Expression $installerScript
}
catch {
    Write-Host "[✗] Ошибка загрузки установщика: $_" -ForegroundColor Red
    Write-Host ""
    Write-Host "Попробуйте скачать установщик вручную:" -ForegroundColor Yellow
    Write-Host "  https://github.com/burtyuo9/seo-monster-windows-installer" -ForegroundColor White
    exit 1
}
