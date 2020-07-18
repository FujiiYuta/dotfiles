#!/bin/sh -xe

echo "installing homebrew..."
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "run brew doctor..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update..."
which brew >/dev/null 2>&1 && brew update

echo "ok. run brew upgrade..."

brew upgrade

formulas=(
    git
    zsh
    tree
    peco
)

echo "start brew install apps..."
for formula in "${formulas[@]}"; do
    brew install $formula || brew upgrade $formula
done

brew tap caskroom/cask

casks=(
    visual-studio-code
    gyazo
    google-chrome
    slack
    alfred
    iterm
    # ここからはできるかわからん
    evernote
    xcode
    clipy
)

echo "start brew cask install apps..."
for cask in "${casks[@]}"; do
    brew cask install $cask
done

brew cleanup
brew cask cleanup

cat << END
**************************************************
HOMEBREW INSTALLED! bye.
**************************************************
END
