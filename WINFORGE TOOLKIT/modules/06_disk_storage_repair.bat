:: modules\06_disk_storage_repair.bat
@echo off
setlocal EnableDelayedExpansion
set "WF_ROOT=%~dp0.."

:menu
call "%WF_ROOT%\core\ui.bat" header
echo MODULE: DISK & STORAGE REPAIR
echo ================================================================================
echo [01] Check Disk
echo [02] Disk Cleanup
echo [03] Defrag
echo [04] List Volumes
echo [99] Back
echo(
set /p "CHOICE=Select Option: "

if "%CHOICE%"=="01" call "%WF_ROOT%\core\executor.bat" "Disk Storage Repair" "Check Disk" "Checks disk integrity" "chkdsk" "MEDIUM" & goto menu
if "%CHOICE%"=="02" call "%WF_ROOT%\core\executor.bat" "Disk Storage Repair" "Disk Cleanup" "Runs disk cleanup utility" "cleanmgr" "SAFE" & goto menu
if "%CHOICE%"=="03" call "%WF_ROOT%\core\executor.bat" "Disk Storage Repair" "Defrag" "Optimizes drive performance" "defrag C:" "MEDIUM" & goto menu
if "%CHOICE%"=="04" call "%WF_ROOT%\core\executor.bat" "Disk Storage Repair" "List Volumes" "Lists available volumes" "wmic logicaldisk get caption,freespace,size" "SAFE" & goto menu
if "%CHOICE%"=="99" exit /b

goto menu
