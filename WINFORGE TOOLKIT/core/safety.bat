@echo off

set "RISK=%~2"

if /i "%RISK%"=="SAFE" exit /b 0

echo WARNING:
echo This command risk level is: %RISK%
echo(
echo Press ENTER to continue.
echo Press BACKSPACE then ENTER to cancel.

set /p "CONFIRM=> "

if "%CONFIRM%"=="" exit /b 0

exit /b 1
