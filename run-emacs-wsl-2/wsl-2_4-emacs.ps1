# WSL2 - Launch Emacs

# Get the IP to use from wsl and set to a variable.
$wslip = wsl -d Ubuntu-20.04 bash -c 'ip route | awk ''/default via /'' | cut -d'' '' -f3'

# Run Emacs
wsl -d Ubuntu-20.04 bash -c "export DISPLAY=$wslip`:0.0 export LIBGL_ALWAYS_INDIRECT=1 && setsid emacs"

# Use this to also set the keyboard layout to US
# wsl -d Ubuntu-20.04 bash -c "export DISPLAY=$wslip`:0.0 export LIBGL_ALWAYS_INDIRECT=1 && setxkbmap -layout us && setsid emacs"