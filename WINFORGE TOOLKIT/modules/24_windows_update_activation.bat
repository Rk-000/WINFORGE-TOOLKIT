:: modules\24_windows_update_activation.bat
@echo off
setlocal
set "WF_ROOT=%~dp0.."

:menu
call "%WF_ROOT%\core\ui.bat" header
echo MODULE: WINDOWS UPDATE ^& ACTIVATION
echo ================================================================================
echo [01] Windows Update Settings
echo [02] Restart Update Service
echo [03] Reset Windows Update
echo [04] Check Activation Status
echo [05] Rearm Windows License
echo [99] Back
echo(
set /p "CHOICE=Select Option: "

if "%CHOICE%"=="01" call "%WF_ROOT%\core\executor.bat" "Windows Update Activation" "Windows Update Settings" "Opens update settings" "start ms-settings:windowsupdate" "SAFE" & goto menu
if "%CHOICE%"=="02" call "%WF_ROOT%\core\executor.bat" "Windows Update Activation" "Restart Update Service" "Restarts Windows Update service" "net stop wuauserv && net start wuauserv" "MEDIUM" & goto menu
if "%CHOICE%"=="03" call "%WF_ROOT%\core\executor.bat" "Windows Update Activation" "Reset Windows Update" "Resets Windows Update components" "net stop wuauserv && rd /s /q %windir%\SoftwareDistribution && net start wuauserv" "HIGH" & goto menu
if "%CHOICE%"=="04" call "%WF_ROOT%\core\executor.bat" "Windows Update Activation" "Activation Status" "Checks Windows activation status" "slmgr /xpr" "SAFE" & goto menu
if "%CHOICE%"=="05" call "%WF_ROOT%\core\executor.bat" "Windows Update Activation" "Rearm Windows License" "Rearms Windows activation" "slmgr /rearm" "HIGH" & goto menu
if "%CHOICE%"=="99" exit /b
goto menu
