:: modules\02_health_check.bat
@echo off
setlocal EnableDelayedExpansion
set "WF_ROOT=%~dp0.."

:menu
call "%WF_ROOT%\core\ui.bat" header
echo MODULE: HEALTH CHECK
echo ================================================================================
echo [01] SFC Verify
echo [02] DISM CheckHealth
echo [03] DISM ScanHealth
echo [04] Check Disk
echo [99] Back
echo(
set /p "CHOICE=Select Option: "

if "%CHOICE%"=="01" call "%WF_ROOT%\core\executor.bat" "Health Check" "SFC Verify" "Verifies protected system files" "sfc /verifyonly" "SAFE" & goto menu
if "%CHOICE%"=="02" call "%WF_ROOT%\core\executor.bat" "Health Check" "DISM CheckHealth" "Checks Windows image health" "DISM /Online /Cleanup-Image /CheckHealth" "SAFE" & goto menu
if "%CHOICE%"=="03" call "%WF_ROOT%\core\executor.bat" "Health Check" "DISM ScanHealth" "Scans Windows image for corruption" "DISM /Online /Cleanup-Image /ScanHealth" "SAFE" & goto menu
if "%CHOICE%"=="04" call "%WF_ROOT%\core\executor.bat" "Health Check" "Check Disk" "Checks disk for errors" "chkdsk" "MEDIUM" & goto menu
if "%CHOICE%"=="99" exit /b

goto menu
