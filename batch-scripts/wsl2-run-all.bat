@echo off
@REM start /wait powershell -WindowStyle Hidden -NoProfile -ExecutionPolicy Bypass -Command "& './wsl2-firewall-rule.ps1'"

@REM start /wait powershell -WindowStyle Hidden -Wait -NoProfile -ExecutionPolicy Bypass `
@REM     -Command "&{ start-process powershell -Wait -NoNewWindow -WindowStyle Hidden '-NoProfile -ExecutionPolicy Bypass -Command "& './wsl2-firewall-rule.ps1'"-noprofile -file C:\script\psfile.ps1' -verb RunAs}"

start /wait PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -Wait '-NoProfile -ExecutionPolicy Bypass -Command ""& './wsl2-firewall-rule.ps1'""' -Verb RunAs}";

echo after powershell

pause
call wsl2-vcxsrv.bat
if errorlevel 1 (
   echo VcXsrv is already running.
   echo.
   echo VcXsrv has to be run after adding the firewall rule.
   echo Please terminate VcXsrv and run this script again.
   echo.
   pause
   exit 1
)

echo emacs
pause
call wsl2-emacs.bat
exit 0