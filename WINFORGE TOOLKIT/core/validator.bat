:: core\validator.bat
@echo off
if "%~1"=="admin" goto admin
if "%~1"=="path" goto path
if "%~1"=="command" goto command
exit /b 1

:admin
net session >nul 2>&1
exit /b %errorlevel%

:path
if exist "%~2" exit /b 0
exit /b 1

:command
where "%~2" >nul 2>&1
exit /b %errorlevel%
