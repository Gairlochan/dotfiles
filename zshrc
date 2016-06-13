# Path to your oh-my-zsh installation.
# 
 export ZSH=/Users/lachlan/.oh-my-zsh
#
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
 ZSH_THEME="jonathan"
#
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"
#
# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
 HYPHEN_INSENSITIVE="true"
#
# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"
#
# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13
#
# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"
#
# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"
#
# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"
#
# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"
#
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
 DISABLE_UNTRACKED_FILES_DIRTY="true"
#
# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
 HIST_STAMPS="dd/mm/yyyy"
#
# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
#
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#  Add wisely, as too many plugins slow down shell startup.
 plugins=(git osx)
#
# User configuration
#
 export PATH="/opt/local/bin:/opt/local/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:~/bin:~/prog:~/prog/booksrc"
# export MANPATH="/usr/local/man:$MANPATH"
#
 source $ZSH/oh-my-zsh.sh
#
# You may need to manually set your language environment
 export LANG=en_AU.UTF-8
#
# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
      export EDITOR='vim'
         else
            export EDITOR='mvim'
 fi
#
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias zshrc="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias ll="ls -FGAlh"
alias ls="ls -FGAC"                  # Preferred 'ls' implementation
alias vim="/opt/local/bin/vim"                      # edit: Opens any file in vim
alias lr="ls -R"
alias gdb="ggdb"
alias la="ls -FGAC | sort -k9,9"
cd() { builtin cd "$@"; ls; }                       # Always list directory contents upon 'cd'
alias ..="cd .."
alias ...="cd ..;cd ..;"
alias ....="cd ..;cd ..;cd ..;"
alias .....="cd ..;cd ..;cd..;cdf ..;"
alias ......="cd ..;cd ..;cd ..;cd ..;cd ..;"

 #   mans:   Search manpage given in argument '1' for term given in argument '2' (case insensitive)
 #           displays paginated result with coloured search terms and two lines surrounding each hit
 #           e.g. 'mans nano exit'
 #   --------------------------------------------------------------------
 mans() 
 {
    man $1 | grep -iC3 --color=always $2 | less
 }
 

 #
 # cats: like mans, but for ordinary text files rather than manual pages.
 cats()
  {
     cat $1 | grep -iC3 --color=always $2 |  less
  }

 #   L E S S   C O L O U R S   F O R   M A N   P A G E S
 #
 
 # CHANGE FIRST NUMBER PAIR FOR COMMAND AND FLAG COLOUR
 # currently 0;33 a.k.a. brown, which is dark yellow for me 
   export LESS_TERMCAP_md=$'\E[0;33;5;74m'  # begin bold
 
 # CHANGE FIRST NUMBER PAIR FOR PARAMETER COLOUR
 # currently 0;36 a.k.a. cyan
     export LESS_TERMCAP_us=$'\E[0;36;5;146m' # begin underline
 
 # don't change anything here
     export LESS_TERMCAP_mb=$'\E[1;31m'        # begin blinking (stop the blinking by turning
    					       # blinking text off in Terminal preferences)
     export LESS_TERMCAP_me=$'\E[0m'           # end mode
     export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
     export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
     export LESS_TERMCAP_ue=$'\E[0m'           # end underline
 
#  #########################################
#  # Colour codes:
#  Black       0;30     Dark Gray     1;30
#  Red         0;31     Light Red     1;31
#  Green       0;32     Light Green   1;32
#  Brown       0;33     Yellow        1;33
#  Blue        0;34     Light Blue    1;34
#  Purple      0;35     Light Purple  1;35
#  Cyan        0;36     Light Cyan    1;36
#  Light Gray  0;37     White         1;37
#  #########################################
 
 
# Coloured terminal prompt (http://www.zsh.org/mla/users//2010/msg00709.html)
  recolor-cmd() {
         region_highlight=()
         colorize=true
         start_pos=0
         for arg in ${(z)BUFFER}; do
             ((start_pos+=${#BUFFER[$start_pos+1,-1]}-${#${BUFFER[$start_pos+1,-1]## #}}))
             ((end_pos=$start_pos+${#arg}))
             if $colorize; then
                 colorize=false
                 res=$(LC_ALL=C builtin type $arg 2>/dev/null)
                 case $res in
                     *'reserved word'*)   style="fg=magenta,bold";;
                     *'alias for'*)       style="fg=cyan,bold";;
                     *'shell builtin'*)   style="fg=yellow,bold";;
                     *'shell function'*)  style='fg=green,bold';;
                     *"$arg is"*)
                         [[ $arg = 'sudo' ]] && style="fg=red,bold" || style="fg=blue,bold";;
                     *)                   style='none,bold';;
                 esac
                 region_highlight+=("$start_pos $end_pos $style")
             fi
             if [[ $arg = '|' ]] || [[ $arg = 'sudo' ]]; then
                   colorize=true
             fi
             start_pos=$end_pos
         done
     }
 
     check-cmd-self-insert() { zle .self-insert && recolor-cmd }
     check-cmd-backward-delete-char() { zle .backward-delete-char && recolor-cmd }
 
     zle -N self-insert check-cmd-self-insert
     zle -N backward-delete-char check-cmd-backward-delete-char




test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$(git_custom_status) $EPS1"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

