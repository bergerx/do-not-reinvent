exec >> /tmp/xinit-log 2>&1
xsetroot -solid black
xmodmap -e "clear lock"
xmodmap -e "add control = Caps_Lock"
pkill ssh-agent
eval `ssh-agent`
xset r rate 200 200
xmonad
