# scripts\powershell\report_generator.ps1

$Date = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"

$DesktopPath = [Environment]::GetFolderPath("Desktop")

$ReportFolder = "$DesktopPath\WinForge_Reports"

if (!(Test-Path $ReportFolder))
{
    New-Item -ItemType Directory -Path $ReportFolder | Out-Null
}

$ReportFile = "$ReportFolder\System_Report_$Date.txt"

"===================================================" | Out-File $ReportFile
"               WINFORGE SYSTEM REPORT              " | Out-File $ReportFile -Append
"===================================================" | Out-File $ReportFile -Append
"" | Out-File $ReportFile -Append

"Generated Time:" | Out-File $ReportFile -Append
Get-Date | Out-File $ReportFile -Append

"" | Out-File $ReportFile -Append
"================ SYSTEM INFORMATION ================" | Out-File $ReportFile -Append

Get-ComputerInfo | Out-File $ReportFile -Append

"" | Out-File $ReportFile -Append
"================ CPU INFORMATION ===================" | Out-File $ReportFile -Append

Get-WmiObject Win32_Processor | Out-File $ReportFile -Append

"" | Out-File $ReportFile -Append
"================ MEMORY INFORMATION ================" | Out-File $ReportFile -Append

Get-WmiObject Win32_PhysicalMemory | Out-File $ReportFile -Append

"" | Out-File $ReportFile -Append
"================ DISK INFORMATION ==================" | Out-File $ReportFile -Append

Get-WmiObject Win32_LogicalDisk | Out-File $ReportFile -Append

"" | Out-File $ReportFile -Append
"================ NETWORK INFORMATION ===============" | Out-File $ReportFile -Append

ipconfig /all | Out-File $ReportFile -Append

"" | Out-File $ReportFile -Append
"================ RUNNING PROCESSES =================" | Out-File $ReportFile -Append

tasklist | Out-File $ReportFile -Append

"" | Out-File $ReportFile -Append
"================ WINDOWS VERSION ===================" | Out-File $ReportFile -Append

systeminfo | Out-File $ReportFile -Append

"" | Out-File $ReportFile -Append
"===================================================" | Out-File $ReportFile -Append
"               END OF WINFORGE REPORT              " | Out-File $ReportFile -Append
"===================================================" | Out-File $ReportFile -Append

Write-Host ""
Write-Host "WinForge Report Generated Successfully"
Write-Host ""
Write-Host "Saved Location:"
Write-Host $ReportFile
Write-Host ""

pause