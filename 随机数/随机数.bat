@echo off && setlocal enabledelayedexpansion

set /p max=how many?

for /l %%i in (1,1,%max%) do (
	set /a num=!random! %% 75 +1
	echo !num!
)

pause