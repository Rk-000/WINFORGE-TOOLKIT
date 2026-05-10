@echo off

set "WF_ROOT=%~dp0.."

if not defined WF_LOG_ROOT (
    call "%WF_ROOT%\core\settings.bat" load
)

set "LOG_TYPE=%~1"
set "LOG_MODULE=%~2"
set "LOG_MESSAGE=%~3"

if /i "%LOG_TYPE%"=="activity" goto activity
if /i "%LOG_TYPE%"=="command" goto command
if /i "%LOG_TYPE%"=="error" goto error
if /i "%LOG_TYPE%"=="search" goto search

exit /b 0

:activity
>>"%WF_LOG_ROOT%\activity\Activity_Log.txt" echo [%date% %time%] Module: %LOG_MODULE% ^| Action: %LOG_MESSAGE%
exit /b 0

:command
>>"%WF_LOG_ROOT%\commands\Command_Log.txt" echo [%date% %time%] Module: %LOG_MODULE% ^| Command: %LOG_MESSAGE%
exit /b 0

:error
>>"%WF_LOG_ROOT%\errors\Error_Log.txt" echo [%date% %time%] Module: %LOG_MODULE% ^| Error: %LOG_MESSAGE%
exit /b 0

:search
>>"%WF_LOG_ROOT%\search\Search_Log.txt" echo [%date% %time%] Search: %LOG_MESSAGE%
exit /b 0
