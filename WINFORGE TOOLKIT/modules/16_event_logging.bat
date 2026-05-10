:: modules\16_event_logging.bat
@echo off
setlocal
set "WF_ROOT=%~dp0.."

:menu
call "%WF_ROOT%\core\ui.bat" header
echo MODULE: EVENT ^& LOGGING TOOLS
echo ================================================================================
echo [01] Event Viewer
echo [02] System Logs
echo [03] Application Logs
echo [04] Security Logs
echo [99] Back
echo(
set /p "CHOICE=Select Option: "

if "%CHOICE%"=="01" call "%WF_ROOT%\core\executor.bat" "Event Logging" "Event Viewer" "Opens event viewer" "eventvwr.msc" "SAFE" & goto menu
if "%CHOICE%"=="02" call "%WF_ROOT%\core\executor.bat" "Event Logging" "System Logs" "Displays system logs" "wevtutil qe System /c:10 /f:text" "SAFE" & goto menu
if "%CHOICE%"=="03" call "%WF_ROOT%\core\executor.bat" "Event Logging" "Application Logs" "Displays application logs" "wevtutil qe Application /c:10 /f:text" "SAFE" & goto menu
if "%CHOICE%"=="04" call "%WF_ROOT%\core\executor.bat" "Event Logging" "Security Logs" "Displays security logs" "wevtutil qe Security /c:10 /f:text" "SAFE" & goto menu
if "%CHOICE%"=="99" exit /b
goto menu
