# WSL2 - Launch Emacs

# Get the IP to use from wsl and set to a variable.
$wslip = wsl -d Ubuntu-20.04 bash -c 'ip route | awk ''/default via /'' | cut -d'' '' -f3'

# Run Emacs
wsl -d Ubuntu-20.04 bash -c "export DISPLAY=$wslip`:0.0 export LIBGL_ALWAYS_INDIRECT=1 && setsid emacs"

# If you want to change the keyboard layout to US.
# x11-xkb-utils needs to be installed (sudo apt install x11-xkb-utils).
# wsl -d Ubuntu-20.04 bash -c "export DISPLAY=$wslip`:0.0 export LIBGL_ALWAYS_INDIRECT=1 && setxkbmap -layout us && setsid emacs"

# If you want to use zsh.
# wsl -d Ubuntu-20.04 zsh -c "export DISPLAY=%mywslip%:0.0 && export LIBGL_ALWAYS_INDIRECT=1 && setsid emacs"
