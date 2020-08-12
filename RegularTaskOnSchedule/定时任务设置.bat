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

set "batDir=!pathStr!\RegularTaskOnSchedule\全自动上传.bat"
echo %batDir%
::schtasks /create /sc minute /mo 1 /tn "TASK BAT Upload files" /TR "%batDir%"
schtasks /create /sc DAILY /mo 1 /ST 22:00 /tn "TASK BAT Upload files" /TR "%batDir%"

pause > nul