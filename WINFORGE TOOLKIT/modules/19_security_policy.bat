:: modules\19_security_policy.bat
@echo off
setlocal
set "WF_ROOT=%~dp0.."

:menu
call "%WF_ROOT%\core\ui.bat" header
echo MODULE: SECURITY ^& POLICY TOOLS
echo ================================================================================
echo [01] Windows Defender
echo [02] Firewall
echo [03] Local Security Policy
echo [04] Defender Quick Scan
echo [05] Defender Full Scan
echo [99] Back
echo(
set /p "CHOICE=Select Option: "

if "%CHOICE%"=="01" call "%WF_ROOT%\core\executor.bat" "Security Policy" "Windows Defender" "Opens Windows Defender" "start windowsdefender:" "SAFE" & goto menu
if "%CHOICE%"=="02" call "%WF_ROOT%\core\executor.bat" "Security Policy" "Firewall" "Opens firewall settings" "wf.msc" "SAFE" & goto menu
if "%CHOICE%"=="03" call "%WF_ROOT%\core\executor.bat" "Security Policy" "Local Security Policy" "Opens local security policy" "secpol.msc" "HIGH" & goto menu
if "%CHOICE%"=="04" call "%WF_ROOT%\core\executor.bat" "Security Policy" "Defender Quick Scan" "Runs quick malware scan" "powershell Start-MpScan -ScanType QuickScan" "SAFE" & goto menu
if "%CHOICE%"=="05" call "%WF_ROOT%\core\executor.bat" "Security Policy" "Defender Full Scan" "Runs full malware scan" "powershell Start-MpScan -ScanType FullScan" "MEDIUM" & goto menu
if "%CHOICE%"=="99" exit /b
goto menu
