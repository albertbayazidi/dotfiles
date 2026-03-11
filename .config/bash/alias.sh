
# Usefull in terminal
alias ls="exa"
alias la="ls -A"
alias grep="grep --color=auto"
alias lock="betterlockscreen -l dim 50"
alias yy="xclip -selection clipboard"
alias feh="feh -."
alias untar="tar -xvzf" 

# ssh alias 
alias ntnussh="ssh -Y albertba@login.stud.ntnu.no"
alias markovssh="ssh -Y albertba@markov.math.ntnu.no"
alias clusterssh="ssh -J albertba@login.stud.ntnu.no albertba@snotra.idi.ntnu.no"
alias pvvssh="ssh albertba@login.pvv.org"
alias pvv2ssh="ssh albertba@login2.pvv.org"
alias serverssh="ssh -Y alb@100.64.0.1"
alias serversshlocal="ssh -Y alb@192.168.0.175"
alias vpsssh="ssh -Yi ~/.ssh/vps root@37.27.176.162"
alias sfp_vpsssh="ssh -Yi ~/.ssh/sfp_vps root@37.27.188.216"
alias phonesshlocal="ssh -p 8022 u0_a240@192.168.0.141"

# tmux alias
alias tmux="tmux -f $HOME/.config/tmux/.tmux.conf"
alias skriving="tmux a -t skriving"
alias koding="tmux a -t koding"

#misc 
alias phone="./git/software/phone/emulator/emulator -avd google-34 -gpu swiftshader_indirect -writable-system"
alias record-screen="ffmpeg -video_size 1920x1080 -framerate 60 -f x11grab -i :0.0 output.mp4"
