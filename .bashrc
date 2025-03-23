#
# ~/.bashrc

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u \W]λ '

# hjemmelagde alias
alias la='ls -A'
alias firedrake='. /home/albert/git/software/firedrake/bin/activate'
alias lock='betterlockscreen -l dim 50'
alias untar='tar -xvzf' 
alias make-qr='qrencode -o ~/pics/qrcode.svg -t SVG'
alias check_journal='journalctl --since "10 minutes ago"'

# ssh alias 
alias serverssh='ssh orangepi@192.168.0.188'
alias markovssh='ssh albertba@markov.math.ntnu.no'
alias pvvssh='ssh albertba@login.pvv.org'
alias pvv2ssh='ssh albertba@login2.pvv.org'

#hjemmelagde hjelpefunksjoner 
make_new() {
    template="$1"
    destination="$2"
    cp -r ~/git/hobby/dotfiles/templates/"$template" "$destination"
}


HISTSIZE=1000

HISTFILESIZE=1000

PROMPT_COMMAND='history -a; history -c; history -r'

HISTFILE=~/.bash_history
