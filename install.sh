#!/bin/sh -xe
# TODO: 実際に行ったコードじゃない可能性があるからもし違ったらmodify

### powerlineのインストール
echo "installing powerline..."

pip install powerline-status

pip install  --user git+git://github.com/powerline/powerline

ln -s /Library/Python/3.7/site-packages/powerline ~/.local/bin

source ~/.zshrc

echo "done."

### SourceCodeProのインストール

cp -a source-code-pro-release/TTF/* ~/Library/Fonts
