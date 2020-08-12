@echo off && setlocal enabledelayedexpansion

REM schtasks /create /sc minutes /tn "TASK BAT Upload files" /TR !path!\RegularTaskOnSchedule\全自动上传.bat

schtasks | findstr /c:"TASK BAT Upload files"

pause > nul