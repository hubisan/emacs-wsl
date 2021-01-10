@REM WSL2 - Launch Emacs

@echo off

SETLOCAL
@REM Get the IP to use from wsl and set to a variable.
for /F "tokens=* USEBACKQ" %%F IN (`wsl bash -c "ip route | awk '/default via /' | cut -d ' ' -f3"`) DO (
set mywslip=%%F
)
@REM Run Emacs.
wsl bash -c "export DISPLAY=%mywslip%:0.0 && export LIBGL_ALWAYS_INDIRECT=1 && setsid emacs"

@REM If you want to change the keyboard layout to US.
@REM x11-xkb-utils needs to be installed (sudo apt install x11-xkb-utils).
@REM wsl bash -c "export DISPLAY=%mywslip%:0.0 && export LIBGL_ALWAYS_INDIRECT=1 && setxkbmap -layout us && setsid emacs"

@REM If you want to use zsh.
@REM wsl zsh -c "export DISPLAY=%mywslip%:0.0 && export LIBGL_ALWAYS_INDIRECT=1 && setsid emacs"

ENDLOCAL

exit /b 0