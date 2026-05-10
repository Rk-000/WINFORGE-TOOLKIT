:: modules\23_rdp_remote.bat
@echo off
setlocal
set "WF_ROOT=%~dp0.."

:menu
call "%WF_ROOT%\core\ui.bat" header
echo MODULE: RDP ^& REMOTE DESKTOP TOOLKIT
echo ================================================================================
echo [01] Open Remote Desktop
echo [02] Enable RDP
echo [03] Disable RDP
echo [04] Restart RDP Service
echo [05] RDP Port Check
echo [99] Back
echo(
set /p "CHOICE=Select Option: "

if "%CHOICE%"=="01" call "%WF_ROOT%\core\executor.bat" "RDP Remote" "Remote Desktop" "Launches Remote Desktop" "mstsc" "SAFE" & goto menu
if "%CHOICE%"=="02" call "%WF_ROOT%\core\executor.bat" "RDP Remote" "Enable RDP" "Enables Remote Desktop" "reg add HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server /v fDenyTSConnections /t REG_DWORD /d 0 /f" "HIGH" & goto menu
if "%CHOICE%"=="03" call "%WF_ROOT%\core\executor.bat" "RDP Remote" "Disable RDP" "Disables Remote Desktop" "reg add HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server /v fDenyTSConnections /t REG_DWORD /d 1 /f" "HIGH" & goto menu
if "%CHOICE%"=="04" call "%WF_ROOT%\core\executor.bat" "RDP Remote" "Restart RDP Service" "Restarts RDP service" "net stop TermService && net start TermService" "HIGH" & goto menu
if "%CHOICE%"=="05" call "%WF_ROOT%\core\executor.bat" "RDP Remote" "RDP Port Check" "Checks port 3389" "netstat -ano | findstr :3389" "SAFE" & goto menu
if "%CHOICE%"=="99" exit /b
goto menu
