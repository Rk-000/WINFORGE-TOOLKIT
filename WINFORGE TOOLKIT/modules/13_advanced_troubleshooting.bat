:: modules\13_advanced_troubleshooting.bat
@echo off
setlocal
set "WF_ROOT=%~dp0.."

:menu
call "%WF_ROOT%\core\ui.bat" header
echo MODULE: ADVANCED TROUBLESHOOTING
echo ================================================================================
echo [01] Reliability Monitor
echo [02] Performance Monitor
echo [03] Event Viewer
echo [04] Windows Memory Diagnostic
echo [99] Back
echo(
set /p "CHOICE=Select Option: "

if "%CHOICE%"=="01" call "%WF_ROOT%\core\executor.bat" "Advanced Troubleshooting" "Reliability Monitor" "Shows system reliability history" "perfmon /rel" "SAFE" & goto menu
if "%CHOICE%"=="02" call "%WF_ROOT%\core\executor.bat" "Advanced Troubleshooting" "Performance Monitor" "Opens performance monitor" "perfmon" "SAFE" & goto menu
if "%CHOICE%"=="03" call "%WF_ROOT%\core\executor.bat" "Advanced Troubleshooting" "Event Viewer" "Displays Windows logs" "eventvwr.msc" "SAFE" & goto menu
if "%CHOICE%"=="04" call "%WF_ROOT%\core\executor.bat" "Advanced Troubleshooting" "Memory Diagnostic" "Runs memory test" "mdsched.exe" "MEDIUM" & goto menu
if "%CHOICE%"=="99" exit /b
goto menu
