@echo off
set /p str=��Ҫ�ս�ĳ���
for /f "tokens=1,2* delims=\ " %%i in ('tasklist^|findstr /i cmd') do (
	echo %%i
	echo %%j
	echo ����ɱ���ý���
	pause
	taskkill /F /PID %%j
)