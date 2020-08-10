@echo off
set /p str=想要终结的程序名字：
for /f "tokens=1,2* delims=\ " %%i in ('tasklist^|findstr /i %str%') do (
	echo %%i
	echo %%j
	echo 即将杀死该进程
	pause
	taskkill /F /PID %%j
)