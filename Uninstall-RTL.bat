@echo off
chcp 65001 >nul
title Antigravity Persian RTL - Uninstall ^& Restore
cd /d "%~dp0"

echo ================================================================
echo   Uninstall Antigravity Persian RTL ^& Restore Original Files
echo ================================================================
echo.
echo Closing Antigravity instances so locked files can be restored...
taskkill /IM "Antigravity.exe" /F >nul 2>&1
taskkill /IM "Antigravity IDE.exe" /F >nul 2>&1
timeout /t 2 /nobreak >nul

python "%~dp0antigravity_rtl.py" restore-shortcuts
python "%~dp0antigravity_rtl.py" restore --target all

echo.
python "%~dp0antigravity_rtl.py" status
echo.
echo Uninstalled and restored to original state.
pause
