@echo off
setlocal EnableDelayedExpansion

echo [INIT] Starting...

chcp 65001 >nul

set "WF_ROOT=%~dp0.."

set "WF_CONFIG=%WF_ROOT%\config"
set "WF_TEMP=%WF_ROOT%\temp"

echo [INIT] Creating folders...

if not exist "%WF_CONFIG%" mkdir "%WF_CONFIG%"
if not exist "%WF_TEMP%" mkdir "%WF_TEMP%"

echo [INIT] Checking admin...

net session >nul 2>&1

if errorlevel 1 (
    echo(
    echo [ERROR] Run As Administrator
    echo(
    pause
    exit /b 1
)

echo [INIT] Loading settings...

if not exist "%WF_ROOT%\core\settings.bat" (
    echo [ERROR] settings.bat missing
    pause
    exit /b 1
)

call "%WF_ROOT%\core\settings.bat" load

echo [INIT] settings.bat finished

echo [INIT] Loading logger...

if not exist "%WF_ROOT%\core\logger.bat" (
    echo [ERROR] logger.bat missing
    pause
    exit /b 1
)

call "%WF_ROOT%\core\logger.bat" activity "STARTUP" "WinForge launched"

echo [INIT] logger.bat finished

echo [INIT] SUCCESS

exit /b 0
