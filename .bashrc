# ~/.bashrc

# paths PLACE IN A DIFFRENT FILE 
export ANDROID_AVD_HOME="$HOME/.android/avd/"
export ANDROID_HOME="$HOME/git/software/phone/"
export ANDROID_SDK_ROOT="$ANDROID_HOME"

export GOPATH="$HOME/.lcocal/go"
export GOBIN="$HOME/.lcocal/bin"

export XDG_CONFIG_HOME="$HOME/.config"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='exa'
alias grep='grep --color=auto'
PS1='[albert \W]λ '

# hjemmelagde alias
alias la='ls -A'
alias lock='betterlockscreen -l dim 50'
alias untar='tar -xvzf' 
alias phone='./git/software/phone/emulator/emulator -avd google-34 -gpu swiftshader_indirect -writable-system'
alias clipy='xclip -selection clipboard'

# ssh alias 
alias ntnussh='ssh -Y albertba@login.stud.ntnu.no'
alias markovssh='ssh -Y albertba@markov.math.ntnu.no'
alias clusterssh='ssh -J albertba@login.stud.ntnu.no albertba@snotra.idi.ntnu.no'
alias pvvssh='ssh albertba@login.pvv.org'
alias pvv2ssh='ssh albertba@login2.pvv.org'

#hjemmelagde hjelpefunksjoner 
. ~/git/hobby/dotfiles/scripts/master.sh


# history configs
HISTSIZE=1000
HISTFILESIZE=1000
PROMPT_COMMAND='history -a; history -c; history -r'
HISTFILE=~/.bash_history
