alias sudo='sudo ' # sudoでaliasを有効にするため

alias emacs='emacs -nw'

alias ll='ls -hla'

alias ~='cd ~'

alias ...='cd ../..'

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

### Added by Yuta for Plugin

zinit load momo-lab/zsh-abbrev-alias # 略語を展開する
zinit ice wait'!0'; zinit load zsh-users/zsh-syntax-highlighting # 実行可能なコマンドに色付け
zinit ice wait'!0'; zinit load zsh-users/zsh-completions # 補完

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh # 補完候補表示

zinit light norman-abramovitz/cf-zsh-autocomplete-plugin # cfコマンドの補完候補表示

# 補完機能を有効にする
autoload -Uz compinit
compinit -u
 if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 大文字小文字を区別しない
#zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'

zstyle ':completion:*' list-colors '' # 補完候補一覧をカラー表示

setopt no_beep # ビープ音停止

setopt nolistbeep # 補完時ビープ音停止

### powerline系の設定
source ~/.bashrc
powerline-daemon -q
. /Library/Python/3.7/site-packages/powerline/bindings/zsh/powerline.zsh

### ls時の色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad

export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

alias ls="ls -GF"
alias gls="gls --color"

zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
