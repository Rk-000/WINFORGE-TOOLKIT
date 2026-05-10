:: scripts\powershell\select_log_folder.ps1

Add-Type -AssemblyName System.Windows.Forms

$FolderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
$FolderBrowser.Description = "Select WinForge Log Save Location"

if ($FolderBrowser.ShowDialog() -eq "OK")
{
    Write-Output $FolderBrowser.SelectedPath
}