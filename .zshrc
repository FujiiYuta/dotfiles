alias sudo='sudo ' # sudoでaliasを有効にするため

alias emacs='emacs -nw'

alias ll='ls -hla'

alias ~='cd ~'

alias ...='cd ../..'

# export PATH=/Users/yutafuj/.ndenv/bin:/Users/yutafuj/.ndenv/bin:/Users/yutafuj/.ndenv/bin:/Users/yutafuj/.ndenv/bin:

export PATH=/Users/yutafuj/.zinit/polaris/sbin:/Users/yutafuj/.zinit/polaris/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/.local/bin

export PATH=/usr/local/bin:$PATH

source .zshenv

### powerline設定
. /usr/local/lib/python3.8/site-packages/powerline/bindings/zsh/powerline.zsh


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
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk


### Added by Yuta for Plugin

zinit load momo-lab/zsh-abbrev-alias # 略語を展開する
zinit ice wait'!0'; zinit load zsh-users/zsh-syntax-highlighting # 実行可能なコマンドに色付け
zinit ice wait'!0'; zinit load zsh-users/zsh-completions # 補完

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh # 補完候補表示
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

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

### ls時の色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad

export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

alias ls="ls -GF"
alias gls="gls --color"

zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

### peco
function peco-history-selection() {
    BUFFER=$(history 1 | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\*?\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "$LBUFFER")
    CURSOR=${#BUFFER}
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

### beauty fe dev設定
export PATH="$HOME/.ndenv/bin:$PATH"
eval "$(ndenv init -)"
export CRUMB_SECRET=JCqxSDKjI6rQHWCumVwZwgtjXF+66Xv1pWtt76Aavk0=
export NCOOKIE_ENV=miniy
export ATHENZ_SECRET=ewogICJkb21haW4iOiAic2VhcmNoLWJlYXV0eS5iZmYtYXBpLmRldiIsCiAgInNlcnZpY2UiOiAiYmZmLXNlcnZpY2UiLAogICJwcml2YXRlX2tleSI6ICJMUzB0TFMxQ1JVZEpUaUJTVTBFZ1VGSkpWa0ZVUlNCTFJWa3RMUzB0TFFwTlNVbEZjRUZKUWtGQlMwTkJVVVZCZFZVMlVUbHdSMnM0VUZFMlFUTnJORkpNZGxOd2NYUmhSVmhrT1dKWFlYSXpZVWRhUXpGalNXTkRVVU5zUVRnM0NqaG5iakJyWTFCR2FqSnBNbUo2WkhnM01rZHlZVTlDY2poTGRrcEJabFZzYW1KbGFtRjBhR2xVWlZwd1VVVkNhMm8xYlVjMlFXSmFlbkkzWXpreWJ5c0tVREYyTmk4cmFuSXdSRlYyU1ZGdlNtY3hiR28xZFVWeWIzQXhjMVI1ZVU1MVZUVlJXWEZ6T0hSMkx6TTFUSFZXVUVOVWRuQkpZV0ZrZDFveE5tWmllQXB1VGpabmMyUmFlRVIyTUZjNGFYcEtSM0EwZDFvNFUya3JhRWRuU3l0NVozTkRMek4yTlU5dGRHdEVTMmhoT1ZRNWFHUkVOM1ZLTVd4UGFFWTFhR1JWQ2pFMFZFZHBSbkpIZVZSc1MwYzVjMjlPYW1waFVraDJTMEZtWW05cVVFeHlWRzB5TUROS2IwVk5WVTFGZVRrM2FqTjRVblpwTVRabVVrSXhaMkZpVlhjS1UwSTVZM2xuY0ZwWWNHUmtVVUoxYjJ4UmJscDRMM2xaTjNsc1l6bGpPRVZaWmtaMGNWRkpSRUZSUVVKQmIwbENRVkZEYkZveU1scDVWazFVUTAxNWJncDNVa2h4ZFVWU1JrcFFiMWRWVkZGU04wOHhTSFpVUTJkdlMxVldaeXM0VWxCaEwybFZaVk5QU0RsTkswOU9aSFV5YlhwSGIyTlhaM0paUm5Kd09IRmhDa0p5Ym05cU5YYzRhVXg2YldvNU5IVjZZM1F4UzJwTWVUbFFjVUozYm1ZeVIwVXhUSFpOZVVWc1QwYzBWRmREZEN0M2JWZDRjbTFZYjJwSFUzbDZWMk1LVkd0aFMzVXdObWhaTDNWcU1WVk1kVlpyYmxaRU5YTm5ibXN4VDBreGVHOXNTSHBvUnpCRGVuVmtSakpHYTB0aGVqSkRaWGw2V0ZwamNXNXJObGhMVWdveU1qRjNla0ZMUlc0NFYzSXZTbFY0U1RSd0x5OUlZVUZrYjNSV2JVZEdjMWx1TVRKUlkwMHdNRlJHWkhneVdHRkpXV2hOT0VFd1RtdHZUalZaVGpGcUNrOHZUVTAxS3pnMFRsRndVRnBCVEdJMFFrUlZjVFJLVDFSclQyRjNhRk5FV2pCM1JEUTNSV1pqY0ZBd2VsWk1UVkkxTUdsaU9YRkNlblpwVVhnMGR6WUtka3d3Ukd4MGJVcEJiMGRDUVZCWmVuZENOa2d4TW1aMlRXNVdUbkIyVmxSUVoyVk9TVlZXVDNGc09UZzFSekpyZW1KaGFtWTJlVk13V0RCU1ZUTlROd3BWZEZwclMyRjFTekJuUjNWbGIzVjZWakZqVFRRNWRUaGlSRlZJWTNOeWJHRjNLMmR6S3paemR5c3plVFJvYlRRck0zUkRXSEp6WWtobE1HTndWR1pMQ25SbVlYbEhOelJ5Ym1kM01EZFdObVIzYWxOaGRqRlRRbGRYUlVwRWMxYzNhekE1YTJsNVEzQTBiVEpKVFdwWVRqRllTRFpxTW5acVFXOUhRa0ZOUTNVS1ltVm1kWEJtUW5obmR6bDNiWFUxYWxoU1pEa3JjbXRhTjBVMk1rbGhkekZFU21JMFkwSnpNV0pyZFc5UmNtODRSV1J1ZG5kcU5FcEZZMGcyTkVOVE5ncDNNa1ZXY1hGaU5ITkxkbU5rTkhJeE5HWkphRGQwYm1VMFNqRTBaMHd4V0VaMldqQlhNa3BEV0hwcWMyOUJaMVptZUcxUmJIaGpWMUI1TTBoNVZuQlhDbkpTVWpOMU5WRlRjRGRJZHpWSVprdDBNMHRyU3k5Qk9UZGhiSEJuVFRaT01IQXZiMVJGTkVSQmIwZEJWekpUUzJoTmNsbFpNMU5tZG01MU9EVnZVMjhLUjJoWFFuSkZRM1ppYUV4dGJVOTZPR3RFWmxKU1ZHRmlTRlp2TlV0TVVVRTFRMVEyWTNaMGRGTmpTMFJMZVdrdk1qQnBiSEpSVVdSQ2RrcHJORzU1V0FwaFdUSXlVRmgwVlc5Q1puaGFjWE5OWWpRd1RISldhemR0Y2taMlp6STFNR0pqWkdkR1VrRk1PREozVTFWWVZYVnBiV2xJWW1NNE1scHdZaXRNVG1sakNuSnVVV05WVm5VcksyWnVPRFpaZDI1R09VSjZVRkpGUTJkWlFVcFZjV1JKZFVwb1dUSlFWWGhqZHpWalEwaDZRbTVVZG1KYWRrTjZTV3RpWnpCVVVrb0tkbUl5VnpReUwzaDNlazUyVmxkaE4zUTRhMkpRVlRoYWNIRjZablZvVjI5Q1pXUmhOblFyU21kVlNtSmxLMmQ0TUdkb0wycEVVWE5EYkN0WlUySldNd3AxVlhWUGNHOHhOamhMUVZKd1FrTm9VMUZwTW1WclNWZFZablJvU0hBMlJGSm5VRk5rTVVOaU5FZzNPV1ZPWVVabGIwbFNkbkl4V1VoQ01qWlpUWGhZQ2twdFRrTjRkMHRDWjFGRWNrb3lTRXA2TTNKTFFYSlliRGhUTmpZMFpHZFZiQ3RLVEd4dFRVeFJRMHd5Y1ZKSmEyTmpOSEZ2ZG1oT2IxWkZPVmhVVUNzS1VYSTRWMHM1WTBsM1NERkRhVFpWWTJSbFV6UnNkRmhLVTNCdlpsRTRTbU5PTWk4d1EwaEdTSGhtUm1RclFuZGxUbTR4WWxsdlprTTFTMnByVGpCcmN3cE1NbmQxUWpWVGFqTTFVSFp3T0ZJMFpHZHJiMDlSZG5od1ZVbGxjbXRqWVhaNWNGSnpjbFZIV25wS1FYZElaalZPYVZoc0wyYzlQUW90TFMwdExVVk9SQ0JTVTBFZ1VGSkpWa0ZVUlNCTFJWa3RMUzB0TFFvPSIsCiAgImtleV9pZCI6ICIwIgp9Cg==

export PICTRANS_PRIVATE_KEY=LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQpNSUlFcEFJQkFBS0NBUUVBdVU2UTlwR2s4UFE2QTNrNFJMdlNwcXRhRVhkOWJXYXIzYUdaQzFjSWNDUUNsQTg3CjhnbjBrY1BGajJpMmJ6ZHg3MkdyYU9CcjhLdkpBZlVsamJlamF0aGlUZVpwUUVCa2o1bUc2QWJaenI3YzkybsKUDF2Ni8ranIwRFV2SVFvSmcxbGo1dUVyb3Axc1R5eU51VTVRWXFzOHR2LzM1THVWUENUdnBJYWFkd1oxNmZieApuTjZnc2RaeER2MFc4aXpKR3A0d1o4U2kraEdnSyt5Z3NDLzN2NU9tdGtES2hhOVQ5aGREN3VKMWxPaEY1aGRVCjE0VEdpRnJHeVRsS0c5c29OamphUkh2S0FmYm9qUExyVG0yMDNKb0VNVU1FeTk3ajN4UnZpMTZmUkIxZ2FiVXcKU0I5Y3lncFpYcGRkUUJ1b2xRblp4L3lZN3lsYzljOEVZZkZ0cVFJREFRQUJBb0lCQVFDbFoyMlp5Vk1UQ015bgp3UkhxdUVSRkpQb1dVVFFSN08xSHZUQ2dvS1VWZys4UlBhL2lVZVNPSDlNK09OZHUybXpHb2NXZ3JZRnJwOHFhCkJybm9qNXc4aUx6bWo5NHV6Y3QxS2pMeTlQcUJ3bmYyR0UxTHZNeUVsT0c0VFdDdCt3bVd4cm1Yb2pHU3l6V2MKVGthS3UwNmhZL3VqMVVMdVZrblZENXNnbmsxT0kxeG9sSHpoRzBDenVkRjJGa0thejJDZXl6WFpjcW5rNlhLUgoyMjF3ekFLRW44V3IvSlV4STRwLy9IYUFkb3RWbUdGc1luMTJRY00wMFRGZHgyWGFJWWhNOEEwTmtvTjVZTjFqCk8vTU01Kzg0TlFwUFpBTGI0QkRVcTRKT1RrT2F3aFNEWjB3RDQ3RWZjcFAwelZMTVI1MGliOXFCenZpUXg0dzYKdkwwRGx0bUpBb0dCQVBZendCNkgxMmZ2TW5WTnB2VlRQZ2VOSVVWT3FsOTg1RzJremJhamY2eVMwWDBSVTNTNwpVdFprS2F1SzBnR3Vlb3V6VjFjTTQ5dThiRFVIY3NybGF3K2dzKzZzdyszeTRobTQrM3RDWHJzYkhlMGNwVGZLCnRmYXlHNzRybmd3MDdWNmR3alNhdjFTQldXRUpEc1c3azA5a2l5Q3A0bTJJTWpYTjFYSDZqMnZqQW9HQkFNQ3UKYmVmdXBmQnhndzl3bXU1alhSZDkrcmtaN0U2MklhdzFESmI0Y0JzMWJrdW9Rcm84RWRudndqNEpFY0g2NENTNgp3MkVWcXFiNHNLdmNkNHIxNGZJaDd0bmU0SjE0Z0wxWEZ2WjBXMkpDWHpqc29BZ1ZmeG1RbHhjV1B5M0h5VnBXCnJSUjN1NVFTcDdIdzVIZkt0M0trSy9BOTdhbHBnTTZOMHAvb1RFNERBb0dBVzJTS2hNcllZM1Nmdm51ODVvU28KR2hXQnJFQ3ZiaExtbU96OGtEZlJSVGFiSFZvNUtMUUE1Q1Q2Y3Z0dFNjS0RLeWkvMjBpbHJRUWRCdkprNG55WAphWTIyUFh0VW9CZnhacXNNYjQwTHJWazdtckZ2ZzI1MGJjZGdGUkFMODJ3U1VYVXVpbWlIYmM4MlpwYitMTmljCnJuUWNVVnUrK2ZuODZZd25GOUJ6UFJFQ2dZQUpVcWRJdUpoWTJQVXhjdzVjQ0h6Qm5UdmJadkN6SWtiZzBUUkoKdmIyVzQyL3h3ek52VldhN3Q4a2JQVThacHF6ZnVoV29CZWRhNnQrSmdVSmJlK2d4MGdoL2pEUXNDbCtZU2JWMwp1VXVPcG8xNjhLQVJwQkNoU1FpMmVrSVdVZnRoSHA2RFJnUFNkMUNiNEg3OWVOYUZlb0lSdnIxWUhCMjZZTXhYCkptTkN4d0tCZ1FEckoySEp6M3JLQXJYbDhTNjY0ZGdVbCtKTGxtTUxRQ0wycVJJa2NjNHFvdmhOb1ZFOVhUUCsKUXI4V0s5Y0l3SDFDaTZVY2RlUzRsdFhKU3BvZlE4SmNOMi8wQ0hGSHhmRmQrQndlTm4xYllvZkM1S2prTjBrcwpMMnd1QjVTajM1UHZwOFI0ZGdrb09RdnhwVUllcmtjYXZ5cFJzclVHWnpKQXdIZjVOaVhsL2c9PQotLS0tLUVORCBSU0EgUFJJVkFURSBLRVktLS0tLQo=


### git補完
zstyle ':completion:*:*:git:*' script ~/.zsh/completion/git-completion.bash

# FPATHに`~/.zsh/completion`を追加
fpath=(~/.zsh/completion $fpath)

# シェル関数`compinit`の自動読み込み
autoload -Uz compinit && compinit -i

export PATH="$HOME/.ndenv/bin:$PATH"
eval "$(ndenv init -)"
