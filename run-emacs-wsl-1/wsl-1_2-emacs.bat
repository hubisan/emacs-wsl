@echo off

wsl -d Ubuntu-20.04 bash -c "export DISPLAY=:0.0 && export LIBGL_ALWAYS_INDIRECT=1 && setsid emacs"

@rem Use this to also set the keyboard layout to US.
@rem wsl -d Ubuntu-20.04 bash -c "export DISPLAY=:0.0 && export LIBGL_ALWAYS_INDIRECT=1 && setxkbmap -layout us && setsid emacs"
