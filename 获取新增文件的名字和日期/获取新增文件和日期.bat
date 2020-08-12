@echo off
::获取datetime
for /f "tokens=1 delims=\ " %%i in ('echo %date%') do (
	set "datetime=%%i"
)

echo %datetime%
pause
::获取新增文件名
dir | findstr /c:"%date:~0,10%" | findstr /v /c:"DIR"

for /f "tokens=4 delims=\ " %%i in ('dir ^| findstr /c:"%date:~0,10%" ^| findstr /v /c:"DIR"') do (
	echo %%i
)

pause

::获取新增目录
cd ..

dir | findstr /c:"%date:~0,10%" | findstr /v /c:"\."
pause