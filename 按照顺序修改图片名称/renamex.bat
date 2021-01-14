@echo off && setlocal enabledelayedexpansion

REM 填入想要开始的序号
REM 暂只支持数字
set /p "a=start:"

for /f "delims=" %%i in ('dir ^/b') do (
	echo %%i
	if not "%%i"=="renamex.bat"	(
		REM 如果不是jpg，请在此处修改后缀名
		REM 如果要以00开头，请在此处增加0
		ren "%%i" "0!a!.jpg"
		set /a a+=1
	)
	
)