# TeX Live Installation Helper

Windows PCの `%HOMEPATH%` に日本語が含まれているユーザのため，TeX Live 2021のインストールを補助するためのプログラムである．`TeX Live 2021`では，環境変数`TEMP`（デフォルトでは，`%HOMEPATH%\AppData\Local\Temp`）に日本語が含まれる場合，インストール時にエラーが発生するため，これを回避するためのプログラムを作成した．

## 免責事項

本プログラムの使用は自由であるが，これを使用することにより発生するいかなる不利益についても，プログラム製作者は責任をとらない．

## 環境

Windows 10日本語版で確認した．他の言語の場合はエラーが出るかもしれないが，そのときは`run_tl_installer.ps1`のencodingをUTF-8に変更すればエラーを回避できるかもしれない．

## 使い方

1. `C:\temp_for_texlive`がすでに存在する場合は削除する．
2. `run.bat`をダブルクリックする．
3. TeX Liveの`install-tl-windows.bat`を選択する．
4. TeX Liveのインストーラにしたがって，インストールを行う．
5. `C:\temp_for_texlive`を削除する．

## 本コードの問題点

環境変数`TEMP`を変更して実行した場合，[TeXworksが起動できないという報告](https://oku.edu.mie-u.ac.jp/tex/mod/forum/discuss.php?d=3088#:~:text=TeXworks%20editorをダブルクリックしても開くことができないという新たな問題が生じました。)がある．
