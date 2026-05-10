# scripts\powershell\select_file.ps1

Add-Type -AssemblyName System.Windows.Forms

$FileDialog = New-Object System.Windows.Forms.OpenFileDialog

$FileDialog.Title = "Select File"
$FileDialog.Filter = "All Files (*.*)|*.*"

if ($FileDialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK)
{
    Write-Output $FileDialog.FileName
}