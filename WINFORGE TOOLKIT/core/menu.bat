@echo off
setlocal EnableDelayedExpansion
set "WF_ROOT=%~dp0.."

:main
call "%WF_ROOT%\core\ui.bat" header

echo [01] System Diagnosis
echo [02] Health Check
echo [03] System Repair
echo [04] Network Diagnosis
echo [05] Network Repair
echo [06] Disk ^& Storage Repair
echo [07] System Restore ^& Recovery
echo [08] User ^& Permission Management
echo [09] File ^& Folder Management
echo [10] Process Control
echo [11] Service Control
echo [12] Power Tools ^& Battery Tools
echo [13] Advanced Troubleshooting
echo [14] System Configuration Tools
echo [15] Performance ^& Monitoring Tools
echo [16] Event ^& Logging Tools
echo [17] Driver ^& System Verification
echo [18] Memory ^& Debugging Tools
echo [19] Security ^& Policy Tools
echo [20] Hidden Windows Utilities
echo [21] Network Advanced Tools
echo [22] Printer ^& Spooler Toolkit
echo [23] RDP / Remote Desktop Toolkit
echo [24] Windows Update ^& Activation
echo [25] Driver Toolkit
echo [26] Backup ^& Restore Toolkit
echo [27] Search Commands
echo [28] Change Log Location
echo [99] Exit
echo(

set /p "CHOICE=Select Option: "

if "%CHOICE%"=="01" call "%WF_ROOT%\modules\01_system_diagnosis.bat" & goto main
if "%CHOICE%"=="02" call "%WF_ROOT%\modules\02_health_check.bat" & goto main
if "%CHOICE%"=="03" call "%WF_ROOT%\modules\03_system_repair.bat" & goto main
if "%CHOICE%"=="04" call "%WF_ROOT%\modules\04_network_diagnosis.bat" & goto main
if "%CHOICE%"=="05" call "%WF_ROOT%\modules\05_network_repair.bat" & goto main
if "%CHOICE%"=="06" call "%WF_ROOT%\modules\06_disk_storage_repair.bat" & goto main
if "%CHOICE%"=="07" call "%WF_ROOT%\modules\07_restore_recovery.bat" & goto main
if "%CHOICE%"=="08" call "%WF_ROOT%\modules\08_user_permission.bat" & goto main
if "%CHOICE%"=="09" call "%WF_ROOT%\modules\09_file_folder.bat" & goto main
if "%CHOICE%"=="10" call "%WF_ROOT%\modules\10_process_control.bat" & goto main
if "%CHOICE%"=="11" call "%WF_ROOT%\modules\11_service_control.bat" & goto main
if "%CHOICE%"=="12" call "%WF_ROOT%\modules\12_power_battery.bat" & goto main
if "%CHOICE%"=="13" call "%WF_ROOT%\modules\13_advanced_troubleshooting.bat" & goto main
if "%CHOICE%"=="14" call "%WF_ROOT%\modules\14_system_configuration.bat" & goto main
if "%CHOICE%"=="15" call "%WF_ROOT%\modules\15_performance_monitoring.bat" & goto main
if "%CHOICE%"=="16" call "%WF_ROOT%\modules\16_event_logging.bat" & goto main
if "%CHOICE%"=="17" call "%WF_ROOT%\modules\17_driver_verification.bat" & goto main
if "%CHOICE%"=="18" call "%WF_ROOT%\modules\18_memory_debugging.bat" & goto main
if "%CHOICE%"=="19" call "%WF_ROOT%\modules\19_security_policy.bat" & goto main
if "%CHOICE%"=="20" call "%WF_ROOT%\modules\20_hidden_utilities.bat" & goto main
if "%CHOICE%"=="21" call "%WF_ROOT%\modules\21_network_advanced.bat" & goto main
if "%CHOICE%"=="22" call "%WF_ROOT%\modules\22_printer_spooler.bat" & goto main
if "%CHOICE%"=="23" call "%WF_ROOT%\modules\23_rdp_remote.bat" & goto main
if "%CHOICE%"=="24" call "%WF_ROOT%\modules\24_windows_update_activation.bat" & goto main
if "%CHOICE%"=="25" call "%WF_ROOT%\modules\25_driver_toolkit.bat" & goto main
if "%CHOICE%"=="26" call "%WF_ROOT%\modules\26_backup_restore.bat" & goto main
if "%CHOICE%"=="27" call "%WF_ROOT%\core\search.bat" & goto main
if "%CHOICE%"=="28" call "%WF_ROOT%\core\settings.bat" change_log & goto main
if "%CHOICE%"=="99" goto exit_app

echo(
echo Invalid choice.
pause
goto main

:exit_app
call "%WF_ROOT%\core\logger.bat" activity "EXIT" "WinForge closed"
exit /b
