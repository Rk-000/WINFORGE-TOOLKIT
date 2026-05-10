:: modules\17_driver_verification.bat
@echo off
setlocal
set "WF_ROOT=%~dp0.."

:menu
call "%WF_ROOT%\core\ui.bat" header
echo MODULE: DRIVER ^& SYSTEM VERIFICATION
echo ================================================================================
echo [01] Driver Query
echo [02] Driver Verifier
echo [03] System Information
echo [04] Device Manager
echo [99] Back
echo(
set /p "CHOICE=Select Option: "

if "%CHOICE%"=="01" call "%WF_ROOT%\core\executor.bat" "Driver Verification" "Driver Query" "Lists installed drivers" "driverquery" "SAFE" & goto menu
if "%CHOICE%"=="02" call "%WF_ROOT%\core\executor.bat" "Driver Verification" "Driver Verifier" "Launches Driver Verifier" "verifier" "HIGH" & goto menu
if "%CHOICE%"=="03" call "%WF_ROOT%\core\executor.bat" "Driver Verification" "System Information" "Displays hardware info" "msinfo32" "SAFE" & goto menu
if "%CHOICE%"=="04" call "%WF_ROOT%\core\executor.bat" "Driver Verification" "Device Manager" "Opens Device Manager" "devmgmt.msc" "SAFE" & goto menu
if "%CHOICE%"=="99" exit /b
goto menu
