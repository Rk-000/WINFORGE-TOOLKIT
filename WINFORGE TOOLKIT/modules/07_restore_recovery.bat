:: modules\07_restore_recovery.bat
@echo off
setlocal
set "WF_ROOT=%~dp0.."

:menu
call "%WF_ROOT%\core\ui.bat" header
echo MODULE: SYSTEM RESTORE ^& RECOVERY
echo ================================================================================
echo [01] Open System Restore
echo [02] Create Restore Point
echo [03] Advanced Startup
echo [04] Recovery Environment
echo [99] Back
echo(
set /p "CHOICE=Select Option: "

if "%CHOICE%"=="01" call "%WF_ROOT%\core\executor.bat" "Restore Recovery" "System Restore" "Launches System Restore" "rstrui.exe" "SAFE" & goto menu
if "%CHOICE%"=="02" call "%WF_ROOT%\core\executor.bat" "Restore Recovery" "Create Restore Point" "Creates restore point" "powershell Checkpoint-Computer -Description WinForgeRestore" "MEDIUM" & goto menu
if "%CHOICE%"=="03" call "%WF_ROOT%\core\executor.bat" "Restore Recovery" "Advanced Startup" "Launches advanced startup" "shutdown /r /o /t 0" "HIGH" & goto menu
if "%CHOICE%"=="04" call "%WF_ROOT%\core\executor.bat" "Restore Recovery" "Recovery Environment" "Opens recovery settings" "start ms-settings:recovery" "SAFE" & goto menu
if "%CHOICE%"=="99" exit /b
goto menu
