@echo off
setlocal EnableDelayedExpansion

set "WF_ROOT=%~dp0.."

set "EX_MODULE=%~1"
set "EX_NAME=%~2"
set "EX_DESC=%~3"
set "EX_COMMAND=%~4"
set "EX_RISK=%~5"

call "%WF_ROOT%\core\ui.bat" header

echo Command Name : %EX_NAME%
echo Description  : %EX_DESC%
echo Risk Level   : %EX_RISK%
echo Command      : %EX_COMMAND%
echo(

call "%WF_ROOT%\core\safety.bat" confirm "%EX_RISK%"
if errorlevel 1 exit /b 1

call "%WF_ROOT%\core\logger.bat" activity "%EX_MODULE%" "Selected: %EX_NAME%"
call "%WF_ROOT%\core\logger.bat" command "%EX_MODULE%" "%EX_COMMAND%"

set "OUTFILE=%WF_ROOT%\temp\last_output.tmp"
set "ERRFILE=%WF_ROOT%\temp\last_error.tmp"

if exist "%OUTFILE%" del /f /q "%OUTFILE%" >nul 2>&1
if exist "%ERRFILE%" del /f /q "%ERRFILE%" >nul 2>&1

echo(
echo ==============================================================================================================
echo LIVE TERMINAL OUTPUT
echo ==============================================================================================================
echo(

cmd /c "%EX_COMMAND%" 1>"%OUTFILE%" 2>"%ERRFILE%"

if exist "%OUTFILE%" type "%OUTFILE%"
if exist "%ERRFILE%" type "%ERRFILE%"

echo(
echo ==============================================================================================================

if exist "%OUTFILE%" (
    for /f "usebackq tokens=* delims=" %%A in ("%OUTFILE%") do (
        call "%WF_ROOT%\core\logger.bat" command "%EX_MODULE%" "OUTPUT: %%A"
    )
)

if exist "%ERRFILE%" (
    for %%S in ("%ERRFILE%") do (
        if %%~zS gtr 0 (
            for /f "usebackq tokens=* delims=" %%A in ("%ERRFILE%") do (
                call "%WF_ROOT%\core\logger.bat" error "%EX_MODULE%" "%%A"
            )
        )
    )
)

if errorlevel 1 (
    call "%WF_ROOT%\core\logger.bat" error "%EX_MODULE%" "Command failed: %EX_COMMAND%"
    echo [FAILED] Command completed with error.
) else (
    echo [SUCCESS] Command completed.
)

pause
endlocal
exit /b
