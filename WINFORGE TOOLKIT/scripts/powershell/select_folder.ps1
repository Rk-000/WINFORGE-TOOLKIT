# scripts\powershell\select_folder.ps1

Add-Type -AssemblyName System.Windows.Forms

$FolderDialog = New-Object System.Windows.Forms.FolderBrowserDialog

$FolderDialog.Description = "Select Folder"

if ($FolderDialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK)
{
    Write-Output $FolderDialog.SelectedPath
}