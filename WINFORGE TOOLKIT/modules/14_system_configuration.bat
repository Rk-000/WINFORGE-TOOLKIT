:: modules\14_system_configuration.bat
@echo off
setlocal
set "WF_ROOT=%~dp0.."

:menu
call "%WF_ROOT%\core\ui.bat" header
echo MODULE: SYSTEM CONFIGURATION
echo ================================================================================
echo [01] MSConfig
echo [02] Registry Editor
echo [03] Group Policy
echo [04] Environment Variables
echo [99] Back
echo(
set /p "CHOICE=Select Option: "

if "%CHOICE%"=="01" call "%WF_ROOT%\core\executor.bat" "System Configuration" "MSConfig" "Opens system configuration" "msconfig" "SAFE" & goto menu
if "%CHOICE%"=="02" call "%WF_ROOT%\core\executor.bat" "System Configuration" "Registry Editor" "Opens registry editor" "regedit" "HIGH" & goto menu
if "%CHOICE%"=="03" call "%WF_ROOT%\core\executor.bat" "System Configuration" "Group Policy" "Opens Group Policy Editor" "gpedit.msc" "HIGH" & goto menu
if "%CHOICE%"=="04" call "%WF_ROOT%\core\executor.bat" "System Configuration" "Environment Variables" "Opens environment variable settings" "rundll32 sysdm.cpl,EditEnvironmentVariables" "SAFE" & goto menu
if "%CHOICE%"=="99" exit /b
goto menu
