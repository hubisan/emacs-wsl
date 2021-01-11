@echo off

wsl -d Ubuntu-20.04 bash -c "export DISPLAY=:0.0 && export LIBGL_ALWAYS_INDIRECT=1 && setsid emacs"

@REM If you want to change the keyboard layout to US.
@REM x11-xkb-utils needs to be installed (sudo apt install x11-xkb-utils).
@REM wsl -d Ubuntu-20.04 bash -c "export DISPLAY=:0.0 && export LIBGL_ALWAYS_INDIRECT=1 && setxkbmap -layout us && setsid emacs"

@REM If you want to use zsh.
@REM wsl -d Ubuntu-20.04 zsh -c "export DISPLAY=:0.0 && export LIBGL_ALWAYS_INDIRECT=1 && setsid emacs"
