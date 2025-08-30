# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# theme: frisk or refined
ZSH_THEME="refined" 

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# PATH
export PATH=$PATH:~/bin/
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:/opt/nvim/nvim-linux64/bin
export PATH=$PATH:$HOME/usr/bin/

# alias
alias c='clear'
alias cat='bat --paging=never'
alias ls='exa'
alias l='exa -l --all --group-directories-first --git'
alias ll='exa -B -l --all --all --group-directories-first --git'

# for fzf
export FZF_DEFAULT_COMMAND='fd'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Vim Mode
bindkey -v
export KEYTIMEOUT=1

setopt PROMPT_SUBST

THEME_PROMPT_PREFIX=${THEME_PROMPT_PREFIX:-''}
THEME_VI_INS_MODE_SYMBOL=${THEME_VI_INS_MODE_SYMBOL:-'λ INSERT'}
THEME_VI_CMD_MODE_SYMBOL=${THEME_VI_CMD_MODE_SYMBOL:-'ᐅ NORMAL'}

THEME_VI_MODE_SYMBOL="${THEME_VI_INS_MODE_SYMBOL}"

zle-keymap-select() {
  if [ "${KEYMAP}" = 'vicmd' ]; then
    THEME_VI_MODE_SYMBOL="${THEME_VI_CMD_MODE_SYMBOL}"
    echo -ne '\e[2 q'
  else
    THEME_VI_MODE_SYMBOL="${THEME_VI_INS_MODE_SYMBOL}"
    echo -ne '\e[6 q'
  fi
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-init {
  echo -ne '\e[6 q'  # initial cursor shape
  zle reset-prompt
}
zle -N zle-line-init

zle-line-finish() {
  THEME_VI_MODE_SYMBOL="${THEME_VI_INS_MODE_SYMBOL}"
}
zle -N zle-line-finish

TRAPINT() {
  THEME_VI_MODE_SYMBOL="${THEME_VI_INS_MODE_SYMBOL}"
  return $(( 128 + $1 ))
}

# VIM mode indicator
RPROMPT=' %F{green}$THEME_VI_MODE_SYMBOL%f'

eval "$(zoxide init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# for claude code (npm global configuration)
source ~/.profile
