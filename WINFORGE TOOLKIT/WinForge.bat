@echo off
setlocal EnableDelayedExpansion

title WINFORGE TOOLKIT
chcp 65001 >nul
mode con cols=120 lines=40
powershell -command "&{$H=get-host;$W=$H.ui.rawui;$B=$W.buffersize;$B.height=3000;$B.width=120;$W.buffersize=$B}"
color 0B

set "WF_ROOT=%~dp0"
set "CORE=%WF_ROOT%core"

cls

echo(
echo ==============================================================================================================
echo                                              WINFORGE TOOLKIT
echo                                    Developed By Rownok Ahmed Khan
echo                        GitHub  : https://github.com/Rk-000
echo                        Website : https://sites.google.com/view/rownokahmedkhan
echo ==============================================================================================================
echo(
echo Initializing WinForge Framework...
echo(

if not exist "%CORE%\init.bat" (
    echo [ERROR] Missing core\init.bat
    pause
    exit /b
)

if not exist "%CORE%\menu.bat" (
    echo [ERROR] Missing core\menu.bat
    pause
    exit /b
)

call "%CORE%\init.bat"

echo(
echo init.bat returned errorlevel = %errorlevel%
echo(

pause

call "%CORE%\menu.bat"

exit /b
