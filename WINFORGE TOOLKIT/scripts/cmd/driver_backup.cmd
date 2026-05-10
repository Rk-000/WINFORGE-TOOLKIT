:: scripts\cmd\driver_backup.cmd

@echo off
setlocal EnableDelayedExpansion

title WinForge Driver Backup

echo.
echo ================================================================================
echo                           WINFORGE DRIVER BACKUP
echo ================================================================================
echo.

:: ==================================================================================
:: DATE/TIME FORMAT
:: ==================================================================================

for /f "tokens=1-4 delims=/ " %%A in ("%date%") do (
    set DD=%%A
    set MM=%%B
    set YY=%%C
)

for /f "tokens=1-2 delims=:." %%A in ("%time%") do (
    set HH=%%A
    set MIN=%%B
)

set "BACKUP_NAME=DriverBackup_!YY!-!MM!-!DD!_!HH!-!MIN!"

:: ==================================================================================
:: SELECT BACKUP LOCATION
:: ==================================================================================

echo Select backup location...
echo.

for /f "usebackq delims=" %%I in (`powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0..\powershell\select_folder.ps1"`) do (
    set "BACKUP_PATH=%%I"
)

if not defined BACKUP_PATH (
    echo.
    echo [ERROR] No folder selected.
    pause
    exit /b 1
)

:: ==================================================================================
:: CREATE BACKUP DIRECTORY
:: ==================================================================================

set "FINAL_PATH=!BACKUP_PATH!\!BACKUP_NAME!"

mkdir "!FINAL_PATH!" >nul 2>&1

echo.
echo Backup Location:
echo !FINAL_PATH!
echo.

:: ==================================================================================
:: EXPORT DRIVERS
:: ==================================================================================

echo Exporting installed drivers...
echo Please wait...
echo.

dism /online /export-driver /destination:"!FINAL_PATH!"

:: ==================================================================================
:: RESULT
:: ==================================================================================

if errorlevel 1 (
    echo.
    echo [FAILED] Driver backup failed.
    echo.
) else (
    echo.
    echo [SUCCESS] Driver backup completed successfully.
    echo.
    echo Saved To:
    echo !FINAL_PATH!
    echo.
)

pause
exit /b