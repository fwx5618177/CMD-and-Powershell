@echo off
setlocal 
netsh interface show interface

set status=
set interface=
for /f "tokens=1,4* delims=\ " %%i in ('netsh interface show interface') do (
	
	set status=%%i
	set interface=%%j %%k


)

	echo %status% ---- %interface%


pause