:: modules\03_system_repair.bat
@echo off
setlocal EnableDelayedExpansion
set "WF_ROOT=%~dp0.."

:menu
call "%WF_ROOT%\core\ui.bat" header
echo MODULE: SYSTEM REPAIR
echo ================================================================================
echo [01] SFC Scan
echo [02] DISM RestoreHealth
echo [03] Winsock Reset
echo [04] Windows Store Reset
echo [99] Back
echo(
set /p "CHOICE=Select Option: "

if "%CHOICE%"=="01" call "%WF_ROOT%\core\executor.bat" "System Repair" "SFC Scan" "Repairs Windows system files" "sfc /scannow" "MEDIUM" & goto menu
if "%CHOICE%"=="02" call "%WF_ROOT%\core\executor.bat" "System Repair" "DISM RestoreHealth" "Repairs Windows image" "DISM /Online /Cleanup-Image /RestoreHealth" "MEDIUM" & goto menu
if "%CHOICE%"=="03" call "%WF_ROOT%\core\executor.bat" "System Repair" "Winsock Reset" "Repairs Windows network stack" "netsh winsock reset" "MEDIUM" & goto menu
if "%CHOICE%"=="04" call "%WF_ROOT%\core\executor.bat" "System Repair" "Windows Store Reset" "Resets Windows Store cache" "wsreset.exe" "SAFE" & goto menu
if "%CHOICE%"=="99" exit /b

goto menu
