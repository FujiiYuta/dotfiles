# dotfiles

## Install my dotfiles

```

$ git clone https://github.com/FujiiYuta/dotfiles.git 
$ cd dotfiles 
$ chmod +x setup.sh 
$ sh setup.sh 
$ chmod +x brew.sh 
$ sh brew.sh 
$ chmod +x install_powerline.sh 
$ sh install_powerline.sh

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

## color

Preferences > Colors > Load Presets > Import

- dotfiles/colors/Japanesque/Japanesque.itermcolors を選択

## shell

General > Command > /bin/zsh