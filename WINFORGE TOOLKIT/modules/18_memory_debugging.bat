:: modules\18_memory_debugging.bat
@echo off
setlocal
set "WF_ROOT=%~dp0.."

:menu
call "%WF_ROOT%\core\ui.bat" header
echo MODULE: MEMORY ^& DEBUGGING
echo ================================================================================
echo [01] Windows Memory Diagnostic
echo [02] RAM Information
echo [03] Debug Settings
echo [04] Event Viewer
echo [99] Back
echo(
set /p "CHOICE=Select Option: "

if "%CHOICE%"=="01" call "%WF_ROOT%\core\executor.bat" "Memory Debugging" "Memory Diagnostic" "Tests system memory" "mdsched.exe" "MEDIUM" & goto menu
if "%CHOICE%"=="02" call "%WF_ROOT%\core\executor.bat" "Memory Debugging" "RAM Information" "Displays RAM details" "wmic memorychip get capacity,speed" "SAFE" & goto menu
if "%CHOICE%"=="03" call "%WF_ROOT%\core\executor.bat" "Memory Debugging" "Debug Settings" "Opens debug settings" "ms-settings:developers" "SAFE" & goto menu
if "%CHOICE%"=="04" call "%WF_ROOT%\core\executor.bat" "Memory Debugging" "Event Viewer" "Shows debug logs" "eventvwr.msc" "SAFE" & goto menu
if "%CHOICE%"=="99" exit /b
goto menu
