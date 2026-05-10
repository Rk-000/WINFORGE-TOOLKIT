:: modules\08_user_permission.bat
@echo off
setlocal
set "WF_ROOT=%~dp0.."

:menu
call "%WF_ROOT%\core\ui.bat" header
echo MODULE: USER ^& PERMISSION MANAGEMENT
echo ================================================================================
echo [01] Local Users
echo [02] User Accounts
echo [03] Add User
echo [04] Local Groups
echo [99] Back
echo(
set /p "CHOICE=Select Option: "

if "%CHOICE%"=="01" call "%WF_ROOT%\core\executor.bat" "User Permission" "Local Users" "Opens local users manager" "lusrmgr.msc" "SAFE" & goto menu
if "%CHOICE%"=="02" call "%WF_ROOT%\core\executor.bat" "User Permission" "User Accounts" "Opens user accounts" "control userpasswords2" "SAFE" & goto menu
if "%CHOICE%"=="03" call "%WF_ROOT%\core\executor.bat" "User Permission" "Add User" "Creates local user" "net user WinForgeUser Password123 /add" "HIGH" & goto menu
if "%CHOICE%"=="04" call "%WF_ROOT%\core\executor.bat" "User Permission" "Local Groups" "Displays local groups" "net localgroup" "SAFE" & goto menu
if "%CHOICE%"=="99" exit /b
goto menu
