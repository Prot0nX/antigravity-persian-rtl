@echo off
chcp 65001 >nul
title Antigravity Persian RTL - Force Re-Patch ^& Shortcuts
cd /d "%~dp0"

echo Closing running Antigravity instances (if any)...
taskkill /IM "Antigravity.exe" /F >nul 2>&1
taskkill /IM "Antigravity IDE.exe" /F >nul 2>&1
timeout /t 2 /nobreak >nul

echo Creating Desktop shortcuts ^& applying latest Vazirmatn + Toolbar patch...
python "%~dp0antigravity_rtl.py" patch --target all --force

echo.
python "%~dp0antigravity_rtl.py" status
echo.
echo Launching Antigravity with Persian RTL Studio Toolbar...
wscript.exe //B //Nologo "%~dp0launch-desktop.vbs"
pause
