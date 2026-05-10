:: modules\09_file_folder.bat
@echo off
setlocal
set "WF_ROOT=%~dp0.."

:menu
call "%WF_ROOT%\core\ui.bat" header
echo MODULE: FILE ^& FOLDER MANAGEMENT
echo ================================================================================
echo [01] Open Temp Folder
echo [02] Cleanup Temp
echo [03] Open Explorer
echo [04] Show Hidden Files
echo [99] Back
echo(
set /p "CHOICE=Select Option: "

if "%CHOICE%"=="01" call "%WF_ROOT%\core\executor.bat" "File Folder" "Open Temp" "Opens temp directory" "explorer %temp%" "SAFE" & goto menu
if "%CHOICE%"=="02" call "%WF_ROOT%\core\executor.bat" "File Folder" "Cleanup Temp" "Deletes temp files" "del /q /f /s %temp%\*" "MEDIUM" & goto menu
if "%CHOICE%"=="03" call "%WF_ROOT%\core\executor.bat" "File Folder" "Open Explorer" "Launches File Explorer" "explorer.exe" "SAFE" & goto menu
if "%CHOICE%"=="04" call "%WF_ROOT%\core\executor.bat" "File Folder" "Show Hidden Files" "Shows hidden files" "reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v Hidden /t REG_DWORD /d 1 /f" "MEDIUM" & goto menu
if "%CHOICE%"=="99" exit /b
goto menu
