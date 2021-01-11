@echo off
wsl -d Ubuntu-20.04 bash -c "cd ~ && wget https://ftp.gnu.org/pub/gnu/emacs/emacs-27.1.tar.gz && tar -xzvf emacs-27.1.tar.gz"
pause
