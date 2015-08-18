@echo off
COLOR E0
echo -=================================-
echo  Run CMD as Admin on Remote Computer
echo -=================================-
set COMPUTERNAME=
set /P COMPUTERNAME=Computer Name or IP: %=%
set PASSWORD=
set /P PASSWORD=Password: %=%
set USERNAME=
set /P USERNAME=Username: %=%
COLOR E0
psexec \\%COMPUTERNAME% -u %USERNAME% -p %PASSWORD% cmd
pause