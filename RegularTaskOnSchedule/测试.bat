@echo off && setlocal enabledelayedexpansion

D:
set "env=D:\codedata\CMD\RegularTaskOnSchedule\env.txt"

set /a count=0
for /f %%i in (%env%) do (
	set /a count+=1
	if !count!==1 set pathStr=%%i
	echo * %%i
	echo !pathStr!
)

pause