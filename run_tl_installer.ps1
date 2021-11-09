#[void][Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")

# ���ϐ�TEMP���ꎞ�I�ɏ���������D
$Env:TEMP = "C:\temp_for_texlive"
New-Item $Env:TEMP -ItemType Directory

if ($? -eq $false) {
    # C:\temp_for_texlive�������̏ꍇ�C
    # �G���[���b�Z�[�W��\�����C�폜�𑣂��D
    Write-Host "Error: You should remove" $Env:TEMP
    exit
}

# �t�@�C�����J���_�C�A���O���CTeX Live��install-tl-windows.bat�̐�΃p�X���擾����D
Add-Type -AssemblyName System.Windows.Forms
$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{
    InitialDirectory = [Environment]::GetFolderPath('Desktop')
    Filter           = 'install-tl-windows.bat (*.bat)|*.bat'
    Title            = 'Select install-tl-windows.bat'
}

if ($FileBrowser.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
    # Cancel��������Ȃ������ꍇ�Cinstall-tl-windows.bat�����s����D
    Write-Host 'Filename:' $FileBrowser.FileName
    Start-Process $FileBrowser.FileName
}
else {
    # ����ȊO�̏ꍇ�́C�L�����Z�����ꂽ���Ƃ�\������D
    Write-Host 'Cancelled'
}
