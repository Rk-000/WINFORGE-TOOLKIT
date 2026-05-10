:: modules\20_hidden_utilities.bat
@echo off
setlocal
set "WF_ROOT=%~dp0.."

:menu
call "%WF_ROOT%\core\ui.bat" header
echo MODULE: HIDDEN WINDOWS UTILITIES
echo ================================================================================
echo [01] God Mode Folder
echo [02] System Configuration
echo [03] Character Map
echo [04] On Screen Keyboard
echo [05] Registry Editor
echo [99] Back
echo(
set /p "CHOICE=Select Option: "

if "%CHOICE%"=="01" call "%WF_ROOT%\core\executor.bat" "Hidden Utilities" "God Mode" "Creates God Mode folder" "mkdir GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}" "MEDIUM" & goto menu
if "%CHOICE%"=="02" call "%WF_ROOT%\core\executor.bat" "Hidden Utilities" "System Configuration" "Opens MSConfig" "msconfig" "SAFE" & goto menu
if "%CHOICE%"=="03" call "%WF_ROOT%\core\executor.bat" "Hidden Utilities" "Character Map" "Opens character map" "charmap" "SAFE" & goto menu
if "%CHOICE%"=="04" call "%WF_ROOT%\core\executor.bat" "Hidden Utilities" "On Screen Keyboard" "Launches on-screen keyboard" "osk" "SAFE" & goto menu
if "%CHOICE%"=="05" call "%WF_ROOT%\core\executor.bat" "Hidden Utilities" "Registry Editor" "Opens registry editor" "regedit" "HIGH" & goto menu
if "%CHOICE%"=="99" exit /b
goto menu
