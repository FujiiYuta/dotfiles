# dotfiles

## Install my dotfiles

```

$ git clone https://github.com/FujiiYuta/dotfiles.git 
$ cd dotfiles 
$ chmod +x setup.sh 
$ sh setup.sh 
$ chmod +x brew.sh 
$ sh brew.sh 
$ chmod +x install.sh 
$ sh install.sh

```

## iTerm2

### Native full screen windows

Preferences > General > Window > Native full screen windowsのチェックを外す

Preferences > Profiles > Window > Settings for New Windows
Style: **Fullscreen** 
Screen: **Screen with Cursor**  
Space: **All Spaces** 

Preferences > Keys > HotKey > Show/hide iTerm2 with a system-wide hotkeyにチェック

HotKey: のテキストボックスを選択しRecording状態になったら**control + enter**

### font

- SourceCodePro

セットアップ済みなので入っているはず

iterm > preferences > profiles > font > sourcecodepro

### color

Preferences > Colors > Load Presets > Import

- dotfiles/colors/Japanesque/Japanesque.itermcolors を選択

## shell

General > Command > /bin/zsh

## System Preferences

- 入力ソース > 前の入力ソースを選択　のチェックを外す

- spotlight > spotlight検索を表示　も外す
