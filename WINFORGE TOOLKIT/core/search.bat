:: core\search.bat
@echo off
setlocal EnableDelayedExpansion
set "WF_ROOT=%~dp0.."
set "DB=%WF_ROOT%\database\commands.csv"

call "%WF_ROOT%\core\ui.bat" header

if not exist "%DB%" (
    echo [ERROR] Missing database:
    echo %DB%
    pause
    exit /b
)

set /p "KEYWORD=Search command/problem/category: "
call "%WF_ROOT%\core\logger.bat" search "SEARCH" "%KEYWORD%"

echo(
echo Results:
echo ==============================================================================================================

set /a COUNT=0
for /f "usebackq tokens=1-7 delims=," %%A in ("%DB%") do (
    echo %%A %%B %%C %%D %%E %%F %%G | findstr /i /c:"%KEYWORD%" >nul
    if not errorlevel 1 (
        set /a COUNT+=1
        echo [!COUNT!] ID: %%A ^| Module: %%B ^| Name: %%C ^| Risk: %%F
        set "R!COUNT!_MODULE=%%B"
        set "R!COUNT!_NAME=%%C"
        set "R!COUNT!_DESC=%%D"
        set "R!COUNT!_CMD=%%E"
        set "R!COUNT!_RISK=%%F"
    )
)

if "%COUNT%"=="0" (
    echo No result found.
    pause
    exit /b
)

echo(
set /p "RUNID=Select result to run, or 99 to back: "
if "%RUNID%"=="99" exit /b

call "%WF_ROOT%\core\executor.bat" "!R%RUNID%_MODULE!" "!R%RUNID%_NAME!" "!R%RUNID%_DESC!" "!R%RUNID%_CMD!" "!R%RUNID%_RISK!"

endlocal
exit /b
