@echo off

pushd %~dp0 2>NUL
set "OD=%cd%"      
pushd %CD%\resources\stage_0_prep\check_update 

wget -N  "http://download.bleepingcomputer.com/sUBs/ComboFix.exe" -P "%OD%\resources\stage_8_manual_tools"
wget -N  "http://thisisudax.org/downloads/JRT.exe" -P "%OD%\resources\stage_8_manual_tools"
wget -N  "http://download.bleepingcomputer.com/Xplode/AdwCleaner.exe" -P "%OD%\resources\stage_8_manual_tools"
pause