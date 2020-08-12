#!/bin/sh -xe

# dotfilesへの移動
THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR

echo "\033[0;32mstart setup... \033[0;39m"

echo "setup symbolic link..."
# dotfileのシンボリックリンク作成
for f in .??*
do
    # 以下の2つはパスする
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    ln -snfv ~/dotfiles/"$f" ~/
done

echo "finish"

source ~/.zshrc

echo "\033[0;32mAll Finish!!! \033[0;39m"
