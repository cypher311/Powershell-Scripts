Echo Off

REM Check Windows Version
ver | findstr /i "5\.0\." > nul
IF %ERRORLEVEL% EQU 0 goto ver_nt5x
ver | findstr /i "5\.1\." > nul
IF %ERRORLEVEL% EQU 0 goto ver_nt5x
ver | findstr /i "5\.2\." > nul
IF %ERRORLEVEL% EQU 0 goto ver_nt5x
ver | findstr /i "6\.0\." > nul
IF %ERRORLEVEL% EQU 0 goto ver_nt6x
ver | findstr /i "6\.1\." > nul
IF %ERRORLEVEL% EQU 0 goto ver_nt6x
goto warn_and_exit

:ver_nt5x
:Run Windows 2000/XP specific commands here
bootcfg /raw /a /safeboot:network /id 1
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v "*UndoSB" /t REG_SZ /d "bootcfg /raw /fastdetect /id 1"
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /V "*Tron" /t REG_SZ /F /D "C:\scripts\tron.bat -a -sp -er -r"
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /t REG_SZ /d 1 /f
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultUserName /t REG_SZ /d "USERNAME" /f
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultDomainName /t REG_SZ /d "DOMAIN" /f
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultPassword /t REG_SZ /d "PASSWORD" /f
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoLogonCount /t REG_DWORD /d 1 /f
SHUTDOWN -r -f -t 07
goto end

:ver_nt6x
:Run Windows Vista/7 specific commands here
bcdedit /set {current} safeboot network
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v "*UndoSB" /t REG_SZ /d "bcdedit /deletevalue {current} safeboot"
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /V "*Tron" /t REG_SZ /F /D "C:\scripts\tron.bat -a -sp -er -r"
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /t REG_SZ /d 1 /f
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultUserName /t REG_SZ /d "USERNAME" /f
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultDomainName /t REG_SZ /d "DOMAIN" /f
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultPassword /t REG_SZ /d "PASSWORD" /f
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoLogonCount /t REG_DWORD /d 1 /f
SHUTDOWN -r -f -t 07
goto end

Echo On

:warn_and_exit
echo Machine OS cannot be determined.

:end 