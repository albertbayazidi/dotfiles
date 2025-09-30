# ~/.bashrc

# paths PLACE IN A DIFFRENT FILE 

export GOPATH="$HOME/.lcocal/go"
export GOBIN="$HOME/.lcocal/bin"

export XDG_CONFIG_HOME="$HOME/.config"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='exa'
alias grep='grep --color=auto'
PS1='[albert-server \W]λ '

# hjemmelagde alias
alias la='ls -A'
alias untar='tar -xvzf' 
alias clipy='xclip -selection clipboard'

# ssh alias 
alias ntnussh='ssh -Y albertba@login.stud.ntnu.no'
alias markovssh='ssh -Y albertba@markov.math.ntnu.no'
alias clusterssh='ssh -J albertba@login.stud.ntnu.no albertba@snotra.idi.ntnu.no'
alias pvvssh='ssh albertba@login.pvv.org'
alias pvv2ssh='ssh albertba@login2.pvv.org'

alias tmux='tmux -f .config/tmux/.tmux.conf'

# history configs
HISTSIZE=1000
HISTFILESIZE=1000
PROMPT_COMMAND='history -a; history -c; history -r'
HISTFILE=~/.bash_history
