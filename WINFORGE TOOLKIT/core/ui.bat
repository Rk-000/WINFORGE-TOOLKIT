@echo off

if /i "%~1"=="header" goto header
if /i "%~1"=="footer" goto footer
exit /b

:header
cls
echo ==============================================================================================================
echo                                              WINFORGE TOOLKIT
echo                                    Developed By Rownok Ahmed Khan
echo                        GitHub  :                          https://github.com/Rk-000
echo                        Website :      https://sites.google.com/view/rownokahmedkhan
echo ==============================================================================================================
echo(
exit /b

:footer
echo(
echo ==============================================================================================================
echo [99] Back / Exit
echo ==============================================================================================================
exit /b
