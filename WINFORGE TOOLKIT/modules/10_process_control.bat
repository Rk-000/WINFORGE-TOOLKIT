:: modules\10_process_control.bat
@echo off
setlocal
set "WF_ROOT=%~dp0.."

:menu
call "%WF_ROOT%\core\ui.bat" header
echo MODULE: PROCESS CONTROL
echo ================================================================================
echo [01] Task Manager
echo [02] Running Tasks
echo [03] Kill Notepad
echo [04] Restart Explorer
echo [99] Back
echo(
set /p "CHOICE=Select Option: "

if "%CHOICE%"=="01" call "%WF_ROOT%\core\executor.bat" "Process Control" "Task Manager" "Opens Task Manager" "taskmgr" "SAFE" & goto menu
if "%CHOICE%"=="02" call "%WF_ROOT%\core\executor.bat" "Process Control" "Running Tasks" "Displays processes" "tasklist" "SAFE" & goto menu
if "%CHOICE%"=="03" call "%WF_ROOT%\core\executor.bat" "Process Control" "Kill Notepad" "Terminates notepad" "taskkill /f /im notepad.exe" "MEDIUM" & goto menu
if "%CHOICE%"=="04" call "%WF_ROOT%\core\executor.bat" "Process Control" "Restart Explorer" "Restarts explorer shell" "taskkill /f /im explorer.exe && start explorer.exe" "MEDIUM" & goto menu
if "%CHOICE%"=="99" exit /b
goto menu
