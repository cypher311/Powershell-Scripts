@ECHO OFF
cls

SET SOURCE="\\bluearmor\shares\Tools\Tron\tron"

SET DEST="C:\scripts"
if not exist %DEST% md %DEST%

robocopy %SOURCE% %DEST% /MIR /dcopy:T /Z /XD %SOURCE%\resources\stage_4_patch /XD %SOURCE%\resources\stage_7_manual_tools

goto END


:END
quit