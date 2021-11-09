
#[void][Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
$Env:TEMP = "C:\temp_for_texlive"
New-Item $Env:TEMP -ItemType Directory
if ($? -eq $false) {
    Write-Host "Error: You should remove" $Env:TEMP
    exit
}
$Env:TMP = $Env:TEMP

Add-Type -AssemblyName System.Windows.Forms
$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{
    InitialDirectory = [Environment]::GetFolderPath('Desktop')
    Filter           = 'install-tl-windows.bat (*.bat)|*.bat'
    Title            = 'Select install-tl-windows.bat'
}

if ($FileBrowser.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
    Write-Host 'Filename:' $FileBrowser.FileName
    Start-Process $FileBrowser.FileName
}
else {
    Write-Host 'Cancelled'
}
