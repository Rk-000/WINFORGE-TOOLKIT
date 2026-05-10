:: modules\12_power_battery.bat
@echo off
setlocal
set "WF_ROOT=%~dp0.."

:menu
call "%WF_ROOT%\core\ui.bat" header
echo MODULE: POWER ^& BATTERY TOOLS
echo ================================================================================
echo [01] Battery Report
echo [02] Power Options
echo [03] Sleep Settings
echo [04] Hibernate ON
echo [99] Back
echo(
set /p "CHOICE=Select Option: "

if "%CHOICE%"=="01" call "%WF_ROOT%\core\executor.bat" "Power Battery" "Battery Report" "Generates battery report" "powercfg /batteryreport" "SAFE" & goto menu
if "%CHOICE%"=="02" call "%WF_ROOT%\core\executor.bat" "Power Battery" "Power Options" "Opens power settings" "powercfg.cpl" "SAFE" & goto menu
if "%CHOICE%"=="03" call "%WF_ROOT%\core\executor.bat" "Power Battery" "Sleep Settings" "Opens sleep settings" "start ms-settings:powersleep" "SAFE" & goto menu
if "%CHOICE%"=="04" call "%WF_ROOT%\core\executor.bat" "Power Battery" "Hibernate ON" "Enables hibernate" "powercfg -h on" "MEDIUM" & goto menu
if "%CHOICE%"=="99" exit /b
goto menu
