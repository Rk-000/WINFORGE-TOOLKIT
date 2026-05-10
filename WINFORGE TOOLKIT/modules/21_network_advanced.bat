:: modules\21_network_advanced.bat
@echo off
setlocal
set "WF_ROOT=%~dp0.."

:menu
call "%WF_ROOT%\core\ui.bat" header
echo MODULE: NETWORK ADVANCED TOOLS
echo ================================================================================
echo [01] ARP Table
echo [02] Route Table
echo [03] Netstat Advanced
echo [04] Open Port Check
echo [05] Flush ARP Cache
echo [99] Back
echo(
set /p "CHOICE=Select Option: "

if "%CHOICE%"=="01" call "%WF_ROOT%\core\executor.bat" "Network Advanced" "ARP Table" "Displays ARP cache" "arp -a" "SAFE" & goto menu
if "%CHOICE%"=="02" call "%WF_ROOT%\core\executor.bat" "Network Advanced" "Route Table" "Displays routing table" "route print" "SAFE" & goto menu
if "%CHOICE%"=="03" call "%WF_ROOT%\core\executor.bat" "Network Advanced" "Netstat Advanced" "Shows advanced network statistics" "netstat -abno" "SAFE" & goto menu
if "%CHOICE%"=="04" call "%WF_ROOT%\core\executor.bat" "Network Advanced" "Open Port Check" "Checks open ports" "netstat -ano" "SAFE" & goto menu
if "%CHOICE%"=="05" call "%WF_ROOT%\core\executor.bat" "Network Advanced" "Flush ARP Cache" "Clears ARP cache" "arp -d *" "MEDIUM" & goto menu
if "%CHOICE%"=="99" exit /b
goto menu
