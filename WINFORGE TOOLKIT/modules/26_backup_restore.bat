:: modules\26_backup_restore.bat
@echo off
setlocal
set "WF_ROOT=%~dp0.."

:menu
call "%WF_ROOT%\core\ui.bat" header
echo MODULE: BACKUP ^& RESTORE TOOLKIT
echo ================================================================================
echo [01] Registry Backup
echo [02] Registry Restore
echo [03] Create Restore Point
echo [04] Backup Drivers
echo [05] Open Backup Folder
echo [99] Back
echo(
set /p "CHOICE=Select Option: "

if "%CHOICE%"=="01" call "%WF_ROOT%\core\executor.bat" "Backup Restore" "Registry Backup" "Backs up registry" "reg export HKLM C:\RegistryBackup.reg /y" "HIGH" & goto menu
if "%CHOICE%"=="02" call "%WF_ROOT%\core\executor.bat" "Backup Restore" "Registry Restore" "Imports registry backup" "reg import C:\RegistryBackup.reg" "HIGH" & goto menu
if "%CHOICE%"=="03" call "%WF_ROOT%\core\executor.bat" "Backup Restore" "Create Restore Point" "Creates restore point" "powershell Checkpoint-Computer -Description WinForgeBackup" "MEDIUM" & goto menu
if "%CHOICE%"=="04" call "%WF_ROOT%\core\executor.bat" "Backup Restore" "Backup Drivers" "Exports installed drivers" "dism /online /export-driver /destination:C:\DriverBackup" "MEDIUM" & goto menu
if "%CHOICE%"=="05" call "%WF_ROOT%\core\executor.bat" "Backup Restore" "Open Backup Folder" "Opens backup directory" "explorer C:\" "SAFE" & goto menu
if "%CHOICE%"=="99" exit /b
goto menu
