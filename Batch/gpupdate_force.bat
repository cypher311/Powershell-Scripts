@echo off
echo --------------------------------------------------------
echo ---GP updater------
echo --------------------------------------------------------
set /p cname= What is the computer name you want to run this on?

psexec \\%cname% -c "c:\scripts\installers\gpupdateForce.BAT" 
