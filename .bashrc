# ~/.bashrc
export ANDROID_AVD_HOME="$HOME/.android/avd/"
export ANDROID_HOME="$HOME/git/software/phone/"
export ANDROID_SDK_ROOT="$ANDROID_HOME"

export JULIA_HOME="$HOME/git/software/julia-1.11.3/bin"
export CONNECTIQ_SDK_HOME="$HOME/.Garmin/ConnectIQ/Sdks/connectiq-sdk-lin-8.2.1-2025-06-19-f69b94140"

export PATH="$CONNECTIQ_SDK_HOME/bin:$JULIA_HOME:$PATH"


export PETSC_DIR=/opt/petsc/linux-c-opt
export PYTHONPATH=/opt/petsc/linux-c-opt/lib:${PYTHONPATH}



# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='rg --color=auto'
PS1='[\u \W]λ '

# hjemmelagde alias
alias la='ls -A'
alias lock='betterlockscreen -l dim 50'
alias untar='tar -xvzf' 
alias make-qr='qrencode -o ~/pics/qrcode.svg -t SVG'
alias check_journal='journalctl --since "10 minutes ago"'
alias phone='./git/software/phone/emulator/emulator -avd google-34 -gpu swiftshader_indirect -writable-system'

# ssh alias 
alias ntnussh='ssh -Y albertba@login.stud.ntnu.no'
alias markovssh='ssh -Y albertba@markov.math.ntnu.no'
alias pvvssh='ssh albertba@login.pvv.org'
alias pvv2ssh='ssh albertba@login2.pvv.org'

# tmux alias
alias tmux-c='tmux attach -t campus'
alias tmux-h='tmux attach -t home'

#hjemmelagde hjelpefunksjoner 
. ~/git/hobby/dotfiles/scripts/master.sh


# history configs
HISTSIZE=1000
HISTFILESIZE=1000
PROMPT_COMMAND='history -a; history -c; history -r'
HISTFILE=~/.bash_history
