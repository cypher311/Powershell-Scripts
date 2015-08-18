@echo off
COLOR E0
echo -==================================================-
echo  This will rename the computer and reboot in 10 sec
echo -==================================================-
set OLDCOMPUTERNAME=
set /P OLDCOMPUTERNAME=Current computer Name: %=%
set NEWCOMPUTERNAME=
set /P NEWCOMPUTERNAME=New Computer Name: %=%
::set USERNAME=
::set /P USERNAME=Username: %=%
COLOR E0
netdom renamecomputer %OLDCOMPUTERNAME%.cci.local /newname:%NEWCOMPUTERNAME% /userD:"Domain"\username /passwordd:"insert password" /usero:"Domain"\username /passwordo:"insert password" /reboot 10
pause