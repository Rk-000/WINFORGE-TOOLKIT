:: modules\25_driver_toolkit.bat
@echo off
setlocal
set "WF_ROOT=%~dp0.."

:menu
call "%WF_ROOT%\core\ui.bat" header
echo MODULE: DRIVER TOOLKIT
echo ================================================================================
echo [01] Device Manager
echo [02] Driver Query
echo [03] Export Drivers
echo [04] Scan Hardware Changes
echo [05] Driver Verifier
echo [99] Back
echo(
set /p "CHOICE=Select Option: "

if "%CHOICE%"=="01" call "%WF_ROOT%\core\executor.bat" "Driver Toolkit" "Device Manager" "Opens Device Manager" "devmgmt.msc" "SAFE" & goto menu
if "%CHOICE%"=="02" call "%WF_ROOT%\core\executor.bat" "Driver Toolkit" "Driver Query" "Lists installed drivers" "driverquery" "SAFE" & goto menu
if "%CHOICE%"=="03" call "%WF_ROOT%\core\executor.bat" "Driver Toolkit" "Export Drivers" "Exports installed drivers" "dism /online /export-driver /destination:C:\DriverBackup" "MEDIUM" & goto menu
if "%CHOICE%"=="04" call "%WF_ROOT%\core\executor.bat" "Driver Toolkit" "Scan Hardware Changes" "Scans for hardware changes" "pnputil /scan-devices" "SAFE" & goto menu
if "%CHOICE%"=="05" call "%WF_ROOT%\core\executor.bat" "Driver Toolkit" "Driver Verifier" "Launches Driver Verifier" "verifier" "HIGH" & goto menu
if "%CHOICE%"=="99" exit /b
goto menu
