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

### ndenvの設定
echo "installing ndenv..."

brew install ndenv

echo 'export PATH="$HOME/.ndenv/bin:$PATH"' >> ~/.zshrc

echo 'eval "$(ndenv init -)"' >> ~/.zshrc

exec $SHELL -l

git clone https://github.com/riywo/node-build.git $(ndenv root)/plugins/node-build

ndenv -v

echo "done."

### gitの補完設定
echo "installing git completion..."

mkdir -p ~/.zsh/completion

curl -o ~/.zsh/completion/git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash

curl -o ~/.zsh/completion/_git https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh

source ~/.zshrc

echo "all done."
