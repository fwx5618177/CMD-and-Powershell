@echo off && setlocal enabledelayedexpansion

set /a num+=0

for /f "delims=" %%i in ('type ����.txt') do (
	
	set "str=%%i"
:next1	
	if not "!str!"=="" (
		set /a num+=1
		if "!str:~0,1!"==" " (
			@echo null	) else (
		@echo !str:~0,1!)
		set "str=!str:~1!"
		goto next1
	)
)

echo ���峤�ȣ�%num% && pause>nul