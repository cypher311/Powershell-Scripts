@echo off
COLOR 80
echo --------------------------------------------------------
echo ---Check what remote services are running---------------
echo echo --------------------------------------------------------
set COMPUTERNAME=
set /P COMPUTERNAME=Computer Name: %=%


tasklist /s %COMPUTERNAME% > "%userprofile%\My Documents\Remote Processes.txt"

notepad "%userprofile%\My Documents\Remote Processes.txt"

pause