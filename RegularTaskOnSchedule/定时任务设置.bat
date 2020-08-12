@echo off
setlocal enabledelayedexpansion

set "env=D:\codedata\CMD\RegularTaskOnSchedule\env.txt"

set /a count=0
for /f %%i in (%env%) do (
	set /a count+=1
	if !count!==1 set pathStr=%%i
	echo * %%i
	echo !pathStr!
)

echo.
::schtasks /create /sc DAILY /tn "TASK BAT Upload files" /TR !path!\RegularTaskOnSchedule\全自动上传.bat /ST 22:00
schtasks /create /sc minute /tn "TASK BAT Upload files" /TR "!pathStr!\RegularTaskOnSchedule\全自动上传.bat"


pause > nul