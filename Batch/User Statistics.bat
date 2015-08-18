@echo off
COLOR 0A
set USERNAME=
set /P USERNAME=USER Name: %=%
net user %USERNAME% /do
pause