@echo off
wsl bash -c "cd ~/emacs-27.1 && ./configure --with-cairo && make && sudo make install && rm ~/emacs-27.1.tar.gz"
pause
