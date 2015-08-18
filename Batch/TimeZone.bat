@echo off
COLOR E0
echo -========================-
echo   Change Time Zone on Remote Computer
echo -========================-
set COMPUTERNAME=
set /P COMPUTERNAME=Computer Name: %=%
set PASSWORD=
set /P PASSWORD=Password: %=%
COLOR E0
psexec \\%COMPUTERNAME% -u Administrator -p %PASSWORD% -i Control.exe %SystemRoot%\system32\TIMEDATE.CPL,,/Z
pause