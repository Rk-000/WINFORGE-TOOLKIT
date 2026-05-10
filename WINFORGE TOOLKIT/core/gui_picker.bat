:: core\gui_picker.bat
@echo off
set "GUI_SELECTED_PATH="

if /i "%~1"=="folder" goto folder
if /i "%~1"=="file" goto file
exit /b 1

:folder
for /f "usebackq delims=" %%I in (`powershell -NoProfile -ExecutionPolicy Bypass -Command "Add-Type -AssemblyName System.Windows.Forms; $d=New-Object System.Windows.Forms.FolderBrowserDialog; $d.Description='%~2'; if($d.ShowDialog() -eq 'OK'){Write-Output $d.SelectedPath}"`) do set "GUI_SELECTED_PATH=%%I"
exit /b 0

:file
for /f "usebackq delims=" %%I in (`powershell -NoProfile -ExecutionPolicy Bypass -Command "Add-Type -AssemblyName System.Windows.Forms; $d=New-Object System.Windows.Forms.OpenFileDialog; $d.Title='%~2'; if($d.ShowDialog() -eq 'OK'){Write-Output $d.FileName}"`) do set "GUI_SELECTED_PATH=%%I"
exit /b 0
