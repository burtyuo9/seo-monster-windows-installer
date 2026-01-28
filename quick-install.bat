@echo off
chcp 65001 >nul
setlocal

:: ============================================
:: SEO Monster - Quick Install Script
:: Загружает и запускает основной установщик
:: ============================================

title SEO Monster - Quick Installer

set "GREEN=[92m"
set "RED=[91m"
set "YELLOW=[93m"
set "BLUE=[94m"
set "CYAN=[96m"
set "RESET=[0m"

echo.
echo %CYAN%╔═══════════════════════════════════════════════════════════╗%RESET%
echo %CYAN%║   🦖 SEO Monster - Quick Installer                        ║%RESET%
echo %CYAN%╚═══════════════════════════════════════════════════════════╝%RESET%
echo.

:: Проверка прав администратора
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo %YELLOW%[!] Рекомендуется запустить от имени администратора%RESET%
    echo %YELLOW%    для автоматической установки зависимостей.%RESET%
    echo.
)

echo %BLUE%Загрузка установщика...%RESET%

:: Создаём временную директорию
set "TEMP_DIR=%TEMP%\seo-monster-installer"
if not exist "%TEMP_DIR%" mkdir "%TEMP_DIR%"

:: Скачиваем установщик
curl -L -o "%TEMP_DIR%\install.bat" "https://raw.githubusercontent.com/burtyuo9/seo-monster-windows-installer/main/install.bat" 2>nul

if exist "%TEMP_DIR%\install.bat" (
    echo %GREEN%[✓] Установщик загружен%RESET%
    echo.
    echo %BLUE%Запуск установки...%RESET%
    echo.
    call "%TEMP_DIR%\install.bat"
) else (
    echo %RED%[✗] Не удалось загрузить установщик%RESET%
    echo.
    echo %YELLOW%Попробуйте скачать установщик вручную:%RESET%
    echo   https://github.com/burtyuo9/seo-monster-windows-installer
    echo.
    pause
    exit /b 1
)
