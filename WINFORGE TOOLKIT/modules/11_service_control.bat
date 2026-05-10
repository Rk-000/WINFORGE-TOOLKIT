:: modules\11_service_control.bat
@echo off
setlocal
set "WF_ROOT=%~dp0.."

:menu
call "%WF_ROOT%\core\ui.bat" header
echo MODULE: SERVICE CONTROL
echo ================================================================================
echo [01] Services Manager
echo [02] List Services
echo [03] Restart Spooler
echo [04] Restart Windows Update
echo [99] Back
echo(
set /p "CHOICE=Select Option: "

if "%CHOICE%"=="01" call "%WF_ROOT%\core\executor.bat" "Service Control" "Services Manager" "Opens services console" "services.msc" "SAFE" & goto menu
if "%CHOICE%"=="02" call "%WF_ROOT%\core\executor.bat" "Service Control" "List Services" "Displays services" "sc query" "SAFE" & goto menu
if "%CHOICE%"=="03" call "%WF_ROOT%\core\executor.bat" "Service Control" "Restart Spooler" "Restarts print spooler" "net stop spooler && net start spooler" "MEDIUM" & goto menu
if "%CHOICE%"=="04" call "%WF_ROOT%\core\executor.bat" "Service Control" "Restart Windows Update" "Restarts update service" "net stop wuauserv && net start wuauserv" "MEDIUM" & goto menu
if "%CHOICE%"=="99" exit /b
goto menu
