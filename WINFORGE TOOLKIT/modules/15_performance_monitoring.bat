:: modules\15_performance_monitoring.bat
@echo off
setlocal
set "WF_ROOT=%~dp0.."

:menu
call "%WF_ROOT%\core\ui.bat" header
echo MODULE: PERFORMANCE ^& MONITORING
echo ================================================================================
echo [01] Resource Monitor
echo [02] Performance Monitor
echo [03] Task Manager
echo [04] CPU Information
echo [99] Back
echo(
set /p "CHOICE=Select Option: "

if "%CHOICE%"=="01" call "%WF_ROOT%\core\executor.bat" "Performance Monitoring" "Resource Monitor" "Shows system resources" "resmon" "SAFE" & goto menu
if "%CHOICE%"=="02" call "%WF_ROOT%\core\executor.bat" "Performance Monitoring" "Performance Monitor" "Displays performance metrics" "perfmon" "SAFE" & goto menu
if "%CHOICE%"=="03" call "%WF_ROOT%\core\executor.bat" "Performance Monitoring" "Task Manager" "Shows running processes" "taskmgr" "SAFE" & goto menu
if "%CHOICE%"=="04" call "%WF_ROOT%\core\executor.bat" "Performance Monitoring" "CPU Information" "Displays CPU details" "wmic cpu get name,maxclockspeed" "SAFE" & goto menu
if "%CHOICE%"=="99" exit /b
goto menu
