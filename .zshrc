# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh

# Open - IA Key API
source ~/.config/.open_ai

# ZSH_THEME="agnoster" # (this is one of the fancy ones)
# see https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#agnoster

# Fix the Java Problem
export _JAVA_AWT_WM_NONREPARENTING=1

# File and Dir colors for ls and other outputs
export LS_OPTIONS='--color=auto'
eval "$(dircolors -b)"

# Theming section  
autoload -U compinit colors zcalc
compinit -d
colors

############################## Functions ##############################
function mkt(){
	mkdir {nmap,content,exploits,scripts}
}

# fzf improvement
function fzf-lovely(){

	if [ "$1" = "h" ]; then
		fzf -m --reverse --preview-window down:20 --preview '[[ $(file --mime {}) =~ binary ]] &&
 	                echo {} is a binary file ||
	                 (bat --style=numbers --color=always {} ||
	                  highlight -O ansi -l {} ||
	                  coderay {} ||
	                  rougify {} ||
	                  cat {}) 2> /dev/null | head -500'

	else
	        fzf -m --preview '[[ $(file --mime {}) =~ binary ]] &&
	                         echo {} is a binary file ||
	                         (bat --style=numbers --color=always {} ||
	                          highlight -O ansi -l {} ||
	                          coderay {} ||
	                          rougify {} ||
	                          cat {}) 2> /dev/null | head -500'
	fi
}

function rmk(){
	scrub -p dod $1
	shred -zun 10 -v $1
}

function traducir(){
	echo "colocala el texto a traducir"
	  read translate
	trans :es "$translate"
}

function translate(){
	echo "place the text to translate"
	  read translate
	trans :en "$translate"
}



#====================COLORt======================================

() {
  emulate -L zsh

  source $HOME/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme
  #source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  source $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

  # Determine terminal capabilities.
  {
    if ! zmodload zsh/langinfo zsh/terminfo ||
       [[ $langinfo[CODESET] != (utf|UTF)(-|)8 || $TERM == (dumb|linux) ]] ||
       (( terminfo[colors] < 256 )); then
      # Don't use the powerline config. It won't work on this terminal.
      local USE_POWERLINE=true
      # Define alias `x` if our parent process is `login`.
      local parent
      if { parent=$(</proc/$PPID/comm) } && [[ ${parent:t} == login ]]; then
        alias x='startx ~/.xinitrc'
      fi
    fi
  } 2>/dev/null

 if [[ $USE_POWERLINE == false ]]; then
    # Use 8 colors and ASCII.
    source $HOME/.p10k-portable.zsh
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=black,bold'
  else
    # Use 256 colors and UNICODE.
    source $HOME/.p10k.zsh
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'
  fi
}

function exists { which $1 &> /dev/null }

if exists percol; then
    function percol_select_history() {
        local tac
        exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
        BUFFER=$(fc -l -n 1 | eval $tac | percol --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh
    }

    zle -N percol_select_history
    bindkey '^R' percol_select_history
fi

#####################################################################################################

# Set up the prompt

autoload -Uz promptinit
promptinit
#prompt adam1
#POWERLEVEL9K_MODE="awesome-fontconfig"

###################################################################
plugins=(
aliases
alias-finder
bazel
bgnotify
branch
coffee
colemak
colored-man-pages
colorize
command-not-found
common-aliases
compleat
copybuffer
copyfile
copypath
cp
cpanm
dash
dircycle
dirhistory
dnote
docker-machine
eecms
emoji
emoji-clock
emotty
extract
fancy-ctrl-z
fastfile
fig
frontend-search
fzf
gatsby
gb
gcloud
gem
gh
git
git-auto-fetch
gitfast
git-flow-avh
github
gitignore
git-prompt
globalias
gnu-utils
grc
history
httpie
jsontools
jump
last-working-dir
man
mysql-macports
node
npm
per-directory-history
perms
please
postgres
profiles
python
react-native
repo
ruby
rust
safe-paste
singlechar
sudo
swiftpm
systemadmin
systemd
term_tab
themes
tig
timer
universalarchive
urltools
vi-mode
vscode
vundle
wd
web-search
wp-cli
yarn
z
zsh-interactive-cd
zsh-navigation-tools
fast-syntax-highlighting
)

  source $HOME/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme
# source /usr/share/powerlevel9k/powerlevel9k.zsh-theme
	source $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
	#source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
	#source $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	#source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	#source ~/path/to/fsh/fast-syntax-highlighting.plugin.zsh
	source $HOME/.oh-my-zsh/custom/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh



function exists { which $1 &> /dev/null }

if exists percol; then
    function percol_select_history() {
        local tac
        exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
        BUFFER=$(fc -l -n 1 | eval $tac | percol --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh
    }

    zle -N percol_select_history
    bindkey '^R' percol_select_history
fi

####################################################

# Use powerline
USE_POWERLINE="true"

## Keybindings section
bindkey -e
bindkey '^[[7~' beginning-of-line                               # Home key
bindkey '^[[H' beginning-of-line                                # Home key
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line                # [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line                                     # End key
bindkey '^[[F' end-of-line                                     # End key
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line                       # [End] - Go to end of line
fi
bindkey '^[[2~' overwrite-mode                                  # Insert key
bindkey '^[[3~' delete-char                                     # Delete key
bindkey '^[[C'  forward-char                                    # Right key
bindkey '^[[D'  backward-char                                   # Left key
bindkey '^[[5~' history-beginning-search-backward               # Page up key
bindkey '^[[6~' history-beginning-search-forward                # Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                                     #
bindkey '^[Od' backward-word                                    #
bindkey '^[[1;5D' backward-word                                 #
bindkey '^[[1;5C' forward-word                                  #
bindkey '^H' backward-kill-word                                 # delete previous word with ctrl+backspace
bindkey '^[[Z' undo                                             # Shift+tab undo last action


# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-R

####################################################
# Manual aliases
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='ls --color'
alias ls='ls $LS_OPTIONS'
#alias cat='bat'
alias cp="cp -i"                                                # Confirm before overwriting something
alias df='df -h'                                                # Human-readable sizes
alias free='free -m'                                            # Show sizes in MB
alias freeram='sudo sync && sudo sysctl -w vm.drop_caches=3'
alias mkg='makepkg -src'
alias actualizardeb='sudo apt-get update && upgrade'
alias clock='tty-clock -C 6 -ct -f "%A, %B %d - %Y"'
alias gitu='git add . && git commit && git push'
alias :q='exit'
alias r='ranger'
alias v='nvim'
alias sourcesconfig='sudo nano /etc/apt/sources.list > /dev/null'
alias polybarconfig='pcmanfm $HOME/.config/polybar > /dev/null'
alias bspmwconfig='pcmanfm $HOME/.config/bspmw > /dev/null'
alias hotkeysconfig='sudo nano $HOME/.config/sxhkd/sxhkdrc > /dev/null'
#Prog
alias zshconfig='mousepad $HOME/.zshrc > /dev/null'
alias mousepads='sudo mousepad > /dev/null'
alias pcmanfms='sudo pcmanfm > /dev/null'
alias mousepad='mousepad > /dev/null'
alias pcmanfm='pcmanfm > /dev/null'
alias youtube='ytfzf -t > /dev/null'
alias youtubemusic='ytfzf -ml > /dev/null'
alias zeal='zeal > /dev/null'
alias code='code > /dev/null'
alias firefox='firefox > /dev/null'
alias lstart='live-server index* > /dev/null'
#SAMBA
alias sambaconfig='sudo nano /etc/samba/smb.conf'
alias sambareboot='sudo systemctl restart smbd.service'
alias sambastop='sudo systemctl stop smbd.service'
#XAMPP
alias xamppmanager='sudo /opt/lampp/manager-linux-x64.run > /dev/null'
alias xamppstart='sudo /opt/lampp/lampp start'
alias xamppstop='sudo /opt/lampp/lampp stop'
alias xamppsrestart='sudo apachectl stop && sudo /opt/lampp/lampp restart'
alias apachestop='sudo apachectl stop'
alias wpconfig='mousepads /opt/lampp/htdocs/wordpress/wp-config.php'
#Vim
alias vimpluginsconfig='sudo nano $HOME/.vim/plugins.vim'
alias vimapsconfig='sudo nano $HOME/.vim/maps.vim'

# Enable Powerlevel10k instant prompt. Should stay at the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to use case-sensitive completion.
 CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
 zstyle ':omz:update' mode auto      # update automatically without asking


#====================Options section======================================

setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.
setopt inc_append_history                                       # save commands are added to the history immediately, otherwise only when shell exits.
setopt histignorespace                                          # Don't save commands that start with space

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'     # Case insensitive tab completion    # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path 
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word

# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Manual configuration

PATH=/root/.local/bin:/snap/bin:/usr/sandbox/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
