@echo off
chcp 65001 >nul
title Antigravity Persian RTL + Studio Toolbar Installer
cd /d "%~dp0"

echo ================================================================
echo   Antigravity Persian RTL + Vazirmatn + Top Toolbar Setup (V2)
echo ================================================================
echo.

echo [1/3] Creating "Antigravity RTL" shortcuts on Desktop ^& Start Menu...
python "%~dp0antigravity_rtl.py" install-shortcuts
echo.

echo [2/3] Patching Antigravity IDE (if installed)...
python "%~dp0antigravity_rtl.py" patch --target ide --force --no-shortcuts
echo.

echo [3/3] Checking Antigravity Desktop status...
tasklist /FI "IMAGENAME eq Antigravity.exe" 2>nul | find /I "Antigravity.exe" >nul
if %ERRORLEVEL%==0 (
    echo Antigravity Desktop is currently running.
    set /p CLOSE_NOW="Close Antigravity now, apply V2 Toolbar + RTL patch, and reopen? [Y/N]: "
    if /I "%CLOSE_NOW%"=="Y" (
        echo Closing Antigravity...
        taskkill /IM "Antigravity.exe" /F >nul 2>&1
        timeout /t 2 /nobreak >nul
        python "%~dp0antigravity_rtl.py" patch --target desktop --force --no-shortcuts
        echo Launching Antigravity with Persian RTL Studio Toolbar...
        wscript.exe //B //Nologo "%~dp0launch-desktop.vbs"
    ) else (
        echo Skipped live restart. Simply close Antigravity and open "Antigravity RTL"
        echo from your Desktop to activate the new Top Toolbar automatically!
    )
) else (
    python "%~dp0antigravity_rtl.py" patch --target desktop --force --no-shortcuts
)

echo.
echo Setup finished!
pause
