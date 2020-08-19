#!/bin/sh -xe
# TODO: 実際に行ったコードじゃない可能性があるからもし違ったらmodify

### powerlineのインストール
echo "installing powerline..."

pip3 install powerline-status

pip3 show powerline-status

echo '. /usr/local/lib/python3.8/site-packages/powerline/bindings/zsh/powerline.zsh' >> ~/.zshrc

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

ndenv install v10.15.3

ndenv global v10.15.3

echo 'ndenv version is'
ndenv -v

echo 'node version is'
node -v

echo 'npm version is'
npm -v

echo "done."

### gitの補完設定
echo "installing git completion..."

mkdir -p ~/.zsh/completion

curl -o ~/.zsh/completion/git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash

curl -o ~/.zsh/completion/_git https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh

source ~/.zshrc

echo "screenshot config"

defaults write com.apple.screencapture location ~/SS/;killall SystemUIServer

echo "all done."
