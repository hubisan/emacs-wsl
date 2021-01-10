@REM WSL2 - Start VcXsrv

@echo off

@REM Can't start it again if it is already running.
tasklist /fi "imagename eq vcxsrv.exe" | find ":" > nul
if errorlevel 1 (
   exit /b 1
)

@REM Start vcxsrv with the flags needed.
start "" "C:\Program Files\VcXsrv\vcxsrv.exe" :0 -multiwindow -clipboard -wgl -ac
exit /b 0