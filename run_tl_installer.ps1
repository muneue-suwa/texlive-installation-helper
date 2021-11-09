#[void][Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")

# 環境変数TEMPを一時的に書き換える．
$Env:TEMP = "C:\temp_for_texlive"
New-Item $Env:TEMP -ItemType Directory

if ($? -eq $false) {
    # C:\temp_for_texliveが既存の場合，
    # エラーメッセージを表示し，削除を促す．
    Write-Host "Error: You should remove" $Env:TEMP
    exit
}

# ファイルを開くダイアログより，TeX Liveのinstall-tl-windows.batの絶対パスを取得する．
Add-Type -AssemblyName System.Windows.Forms
$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{
    InitialDirectory = [Environment]::GetFolderPath('Desktop')
    Filter           = 'install-tl-windows.bat (*.bat)|*.bat'
    Title            = 'Select install-tl-windows.bat'
}

if ($FileBrowser.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
    # Cancelが押されなかった場合，install-tl-windows.batを実行する．
    Write-Host 'Filename:' $FileBrowser.FileName
    Start-Process $FileBrowser.FileName
}
else {
    # それ以外の場合は，キャンセルされたことを表示する．
    Write-Host 'Cancelled'
}
