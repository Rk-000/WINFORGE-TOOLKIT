@echo off

set "WF_ROOT=%~dp0.."
set "WF_CONFIG=%WF_ROOT%\config"
set "WF_PATHS=%WF_CONFIG%\paths.ini"

if "%~1"=="load" goto load
if "%~1"=="change_log" goto change_log
exit /b 0

:load
if not exist "%WF_CONFIG%" mkdir "%WF_CONFIG%"

if not exist "%WF_PATHS%" (
    call "%WF_ROOT%\core\gui_picker.bat" folder "Select WinForge Log Save Location"
    if not defined GUI_SELECTED_PATH set "GUI_SELECTED_PATH=%USERPROFILE%\Documents"
    echo LOG_PATH=%GUI_SELECTED_PATH%\WinForge_Logs>"%WF_PATHS%"
)

set "WF_LOG_ROOT="

for /f "usebackq tokens=1,* delims==" %%A in ("%WF_PATHS%") do (
    if /i "%%A"=="LOG_PATH" set "WF_LOG_ROOT=%%B"
)

if not defined WF_LOG_ROOT set "WF_LOG_ROOT=%USERPROFILE%\Documents\WinForge_Logs"

if not exist "%WF_LOG_ROOT%" mkdir "%WF_LOG_ROOT%"
if not exist "%WF_LOG_ROOT%\activity" mkdir "%WF_LOG_ROOT%\activity"
if not exist "%WF_LOG_ROOT%\commands" mkdir "%WF_LOG_ROOT%\commands"
if not exist "%WF_LOG_ROOT%\errors" mkdir "%WF_LOG_ROOT%\errors"
if not exist "%WF_LOG_ROOT%\search" mkdir "%WF_LOG_ROOT%\search"

exit /b 0

:change_log
call "%WF_ROOT%\core\gui_picker.bat" folder "Select New WinForge Log Save Location"
if not defined GUI_SELECTED_PATH exit /b 1
echo LOG_PATH=%GUI_SELECTED_PATH%\WinForge_Logs>"%WF_PATHS%"
call "%WF_ROOT%\core\settings.bat" load
exit /b 0
