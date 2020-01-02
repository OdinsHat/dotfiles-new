#! /usr/bin/zsh

### Added by Zplugin's installer
source '/home/josh/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk

export PYTHONPATH=$PYTHONPATH:/usr/share/vim/vimfiles/plugin/
export PATH="$PATH:/opt/xtensa-esp32-elf/bin:/home/josh/.config/composer/vendor/bin"
export EDITOR="vim"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Code
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/code
source /usr/bin/virtualenvwrapper.sh

# ZPlugin plugins and config

# httpstat installed
zplugin ice as"program" cp"httpstat.sh -> httpstat" pick"httpstat"
zplugin light b4b4r07/httpstat

zplugin light bhilburn/powerlevel9k
zplugin ice nocompletions # p10k has no need for completion symlinking
zplugin load robobenklein/p10k
autoload -U promptinit; promptinit
prompt p10k

# Improving Git
zplugin ice wait"2" lucid as"program" pick"bin/git-dsf"
zplugin light zdharma/zsh-diff-so-fancy
zplugin ice wait"2" lucid as"program" pick"$ZPFX/bin/git-now" make"prefix=$ZPFX install"
zplugin light iwata/git-now
zplugin ice wait"2" lucid as"program" pick"$ZPFX/bin/git-alias" make"PREFIX=$ZPFX" nocompile
zplugin light tj/git-extras
zplugin ice wait"2" lucid as"program" atclone'perl Makefile.PL PREFIX=$ZPFX' atpull'%atclone' \
            make'install' pick"$ZPFX/bin/git-cal"
zplugin light k4rthik/git-cal

# Auto suggesstons in Turbo mode
zplugin ice wait'1' atload'_zsh_autosuggest_start'
zplugin light zsh-users/zsh-autosuggestions

# Crasis Plugin
zplugin ice wait'[[ -n ${ZLAST_COMMANDS[(r)cras*]} ]]'
zplugin load zdharma/zplugin-crasis

# Alias Plugins

zplugin snippet OMZ::plugins/common-aliases/common-aliases.plugin.zsh
zplugin snippet OMZ::plugins/git/git.plugin.zsh
zplugin snippet OMZ::plugins/gitignore/gitignore.plugin.zsh
zplugin snippet OMZ::plugins/tmuxinator/tmuxinator.plugin.zsh
zplugin snippet OMZ::plugins/sudo/sudo.plugin.zsh
zplugin snippet OMZ::plugins/dotenv/dotenv.plugin.zsh
zplugin snippet OMZ::plugins/npm/npm.plugin.zsh
zplugin snippet OMZ::lib/git.zsh
# zplugin snippet OMZ::plugins/perms/perms.plugin.zsh
zplugin load djui/alias-tips
zplugin load MichaelAquilina/zsh-you-should-use

# fzf Widgets
zplugin light ytet5uy4/fzf-widgets
bindkey '^@'  fzf-select-widget
bindkey '^@.' fzf-edit-dotfiles
bindkey '^@c' fzf-change-directory
bindkey '^@n' fzf-change-named-directory
bindkey '^@f' fzf-edit-files
bindkey '^@k' fzf-kill-processes
bindkey '^@s' fzf-exec-ssh
bindkey '^\'  fzf-change-recent-directory
bindkey '^r'  fzf-insert-history
bindkey '^xf' fzf-insert-files
bindkey '^xd' fzf-insert-directory
bindkey '^xn' fzf-insert-named-directory

## Git
bindkey '^@g'  fzf-select-git-widget
bindkey '^@ga' fzf-git-add-files
bindkey '^@gc' fzf-git-change-repository

# GitHub
bindkey '^@h'  fzf-select-github-widget
bindkey '^@hs' fzf-github-show-issue
bindkey '^@hc' fzf-github-close-issue

## Docker
bindkey '^@d'  fzf-select-docker-widget
bindkey '^@dc' fzf-docker-remove-containers
bindkey '^@di' fzf-docker-remove-images
bindkey '^@dv' fzf-docker-remove-volumes

# Enable Exact-match by fzf-insert-history
FZF_WIDGET_OPTS[insert-history]='--exact'

# Start fzf in a tmux pane
FZF_WIDGET_TMUX=1



zplugin light zsh-users/zsh-autosuggestions
zplugin light zdharma/fast-syntax-highlighting

# The following lines were added by compinstall

zstyle ':completion:*' auto-description '%d'
zstyle ':completion:*' completer _list _oldlist _expand _complete _ignored _match _correct _approximate _prefix
zstyle ':completion:*' completions 1
zstyle ':completion:*' expand prefix
zstyle ':completion:*' file-sort name
zstyle ':completion:*' format '%d'
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous false
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '+l:|=* r:|=*' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=* r:|=*' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' match-original both
zstyle ':completion:*' max-errors 5
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' substitute 1
zstyle ':completion:*' verbose true

# tmuxp completions

zstyle :compinstall filename '/home/josh/.zshrc'

autoload -Uz compinit
compinit

setopt autocd beep extendedglob nomatch notify autopushd

# History Options
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory
setopt extendedhistory
setopt extended_history
setopt histexpiredupsfirst
setopt histignorespace
setopt sharehistory
setopt share_history
setopt inc_append_history
setopt histignorespace

# Be Emacs like. :/
bindkey -e

# Setting Up Theme

# Load OMZ Git library

# Load Git plugin from OMZ
#zplugin snippet OMZ::plugins/git/git.plugin.zsh
#zplugin cdclear -q # <- forget completions provided up to this moment

#setopt promptsubst

# Load theme from OMZ
# zplugin snippet OMZ::themes/dstufft.zsh-theme

# Load normal Github plugin with theme depending on OMZ Git library
#zplugin light NicoSantangelo/Alpharized

#zplugin ice pick"async.zsh" src"pure.zsh"; zplugin light sindresorhus/pure

# Aliases
[ -f .aliases ] && source .aliases

set laststatus=2

# Allows globbing of scp
# https://superuser.com/questions/584249/using-wildcards-in-commands-with-zsh/740728#740728
autoload -U url-quote-magic  
#zle -N self-insert url-quote-magic
#some_remote_commands=(scp rsync)
#zstyle -e :urlglobber url-other-schema \
#  '[[ $some_remote_commands[(i)$words[1]] -le ${#some_remote_commands} ]] && reply=("*") || reply=(http https ftp)'
# alias taurus=/usr/bin/taurus

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/josh/Code/google-cloud-sdk/path.zsh.inc' ]; then . '/home/josh/Code/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/josh/Code/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/josh/Code/google-cloud-sdk/completion.zsh.inc'; fi

# Setup config alias for keeping dotfiles in check
alias config='/usr/bin/git --git-dir=/home/josh/.cfg/ --work-tree=/home/josh'
