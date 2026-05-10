:: scripts\cmd\repair_update.cmd

@echo off

net stop wuauserv
net stop bits

rd /s /q %windir%\SoftwareDistribution

net start bits
net start wuauserv

pause