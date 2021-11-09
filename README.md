# TeX Live Installation Helper

## 環境

Windows 10日本語版で確認した．他の言語の場合はエラーが出るかもしれないが，そのときは`run_tl_installer.ps1`のencodingをUTF-8に変更すればエラーを回避できるかもしれない．

## 使い方

1. `C:\temp_for_texlive`が存在する場合は削除する．
2. `run.bat`をダブルクリックする．
3. TeX Liveの`install-tl-windows.bat`を選択する．
4. TeX Liveのインストーラにしたがって，インストールを行う．
5. `C:\temp_for_texlive`を削除する．

## 背景

環境変数`TEMP`に日本語が含まれる場合，インストール時にエラーが発生するため，これを簡単に回避するプログラムを作成した．
