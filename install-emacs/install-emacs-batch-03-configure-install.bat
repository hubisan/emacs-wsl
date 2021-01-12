@echo off

@REM 3. Configure and install Emacs.

wsl -d Ubuntu-20.04 bash -c "cd ~/emacs-27.1 && ./configure --with-cairo && make && sudo make install && rm ~/emacs-27.1.tar.gz"

pause
