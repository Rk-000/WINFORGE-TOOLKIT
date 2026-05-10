:: modules\04_network_diagnosis.bat
@echo off
setlocal EnableDelayedExpansion
set "WF_ROOT=%~dp0.."

:menu
call "%WF_ROOT%\core\ui.bat" header
echo MODULE: NETWORK DIAGNOSIS
echo ================================================================================
echo [01] IP Configuration
echo [02] Ping Google
echo [03] Netstat
echo [04] Tracert Google
echo [05] DNS Cache
echo [99] Back
echo(
set /p "CHOICE=Select Option: "

if "%CHOICE%"=="01" call "%WF_ROOT%\core\executor.bat" "Network Diagnosis" "IP Configuration" "Displays IP configuration" "ipconfig /all" "SAFE" & goto menu
if "%CHOICE%"=="02" call "%WF_ROOT%\core\executor.bat" "Network Diagnosis" "Ping Google" "Tests internet connectivity" "ping google.com" "SAFE" & goto menu
if "%CHOICE%"=="03" call "%WF_ROOT%\core\executor.bat" "Network Diagnosis" "Netstat" "Displays active network connections" "netstat -ano" "SAFE" & goto menu
if "%CHOICE%"=="04" call "%WF_ROOT%\core\executor.bat" "Network Diagnosis" "Tracert Google" "Traces route to Google" "tracert google.com" "SAFE" & goto menu
if "%CHOICE%"=="05" call "%WF_ROOT%\core\executor.bat" "Network Diagnosis" "DNS Cache" "Displays DNS cache" "ipconfig /displaydns" "SAFE" & goto menu
if "%CHOICE%"=="99" exit /b

goto menu
