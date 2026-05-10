:: modules\05_network_repair.bat
@echo off
setlocal EnableDelayedExpansion
set "WF_ROOT=%~dp0.."

:menu
call "%WF_ROOT%\core\ui.bat" header
echo MODULE: NETWORK REPAIR
echo ================================================================================
echo [01] Flush DNS
echo [02] Winsock Reset
echo [03] IP Reset
echo [04] Release/Renew IP
echo [05] Full Network Repair
echo [99] Back
echo(
set /p "CHOICE=Select Option: "

if "%CHOICE%"=="01" call "%WF_ROOT%\core\executor.bat" "Network Repair" "Flush DNS" "Clears DNS cache" "ipconfig /flushdns" "SAFE" & goto menu
if "%CHOICE%"=="02" call "%WF_ROOT%\core\executor.bat" "Network Repair" "Winsock Reset" "Repairs Winsock catalog" "netsh winsock reset" "MEDIUM" & goto menu
if "%CHOICE%"=="03" call "%WF_ROOT%\core\executor.bat" "Network Repair" "IP Reset" "Resets TCP/IP stack" "netsh int ip reset" "MEDIUM" & goto menu
if "%CHOICE%"=="04" call "%WF_ROOT%\core\executor.bat" "Network Repair" "Release Renew IP" "Refreshes IP configuration" "ipconfig /release && ipconfig /renew" "MEDIUM" & goto menu
if "%CHOICE%"=="05" call "%WF_ROOT%\core\executor.bat" "Network Repair" "Full Network Repair" "Performs full network repair" "ipconfig /flushdns && netsh winsock reset && netsh int ip reset" "HIGH" & goto menu
if "%CHOICE%"=="99" exit /b

goto menu
