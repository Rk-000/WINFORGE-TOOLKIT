:: scripts\cmd\reset_network.cmd

@echo off

ipconfig /flushdns
netsh winsock reset
netsh int ip reset
ipconfig /release
ipconfig /renew

pause