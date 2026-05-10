:: modules\01_system_diagnosis.bat
@echo off
setlocal EnableDelayedExpansion
set "WF_ROOT=%~dp0.."

:menu
call "%WF_ROOT%\core\ui.bat" header
echo MODULE: SYSTEM DIAGNOSIS
echo ================================================================================
echo [01] System Information
echo [02] Computer Management
echo [03] Device Manager
echo [04] DirectX Diagnostic
echo [05] Driver Query
echo [99] Back
echo(
set /p "CHOICE=Select Option: "

if "%CHOICE%"=="01" call "%WF_ROOT%\core\executor.bat" "System Diagnosis" "System Information" "Displays Windows system information" "msinfo32" "SAFE" & goto menu
if "%CHOICE%"=="02" call "%WF_ROOT%\core\executor.bat" "System Diagnosis" "Computer Management" "Opens computer management console" "compmgmt.msc" "SAFE" & goto menu
if "%CHOICE%"=="03" call "%WF_ROOT%\core\executor.bat" "System Diagnosis" "Device Manager" "Opens device manager" "devmgmt.msc" "SAFE" & goto menu
if "%CHOICE%"=="04" call "%WF_ROOT%\core\executor.bat" "System Diagnosis" "DirectX Diagnostic" "Runs DirectX diagnostics" "dxdiag" "SAFE" & goto menu
if "%CHOICE%"=="05" call "%WF_ROOT%\core\executor.bat" "System Diagnosis" "Driver Query" "Lists installed drivers" "driverquery" "SAFE" & goto menu
if "%CHOICE%"=="99" exit /b

goto menu
