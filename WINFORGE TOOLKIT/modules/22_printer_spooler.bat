:: modules\22_printer_spooler.bat
@echo off
setlocal
set "WF_ROOT=%~dp0.."

:menu
call "%WF_ROOT%\core\ui.bat" header
echo MODULE: PRINTER ^& SPOOLER TOOLKIT
echo ================================================================================
echo [01] Restart Spooler
echo [02] Printer Settings
echo [03] Clear Print Queue
echo [04] Print Management
echo [05] Printer Drivers
echo [99] Back
echo(
set /p "CHOICE=Select Option: "

if "%CHOICE%"=="01" call "%WF_ROOT%\core\executor.bat" "Printer Spooler" "Restart Spooler" "Restarts print spooler service" "net stop spooler && net start spooler" "MEDIUM" & goto menu
if "%CHOICE%"=="02" call "%WF_ROOT%\core\executor.bat" "Printer Spooler" "Printer Settings" "Opens printer settings" "start ms-settings:printers" "SAFE" & goto menu
if "%CHOICE%"=="03" call "%WF_ROOT%\core\executor.bat" "Printer Spooler" "Clear Print Queue" "Deletes print queue files" "del /q /f /s %systemroot%\System32\spool\PRINTERS\*" "HIGH" & goto menu
if "%CHOICE%"=="04" call "%WF_ROOT%\core\executor.bat" "Printer Spooler" "Print Management" "Opens print management console" "printmanagement.msc" "SAFE" & goto menu
if "%CHOICE%"=="05" call "%WF_ROOT%\core\executor.bat" "Printer Spooler" "Printer Drivers" "Opens printer driver manager" "printui /s /t2" "SAFE" & goto menu
if "%CHOICE%"=="99" exit /b
goto menu
