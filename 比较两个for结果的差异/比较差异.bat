@echo off
::adb临时加入到path环境变量
set My_PATH=.\SDK\adb
set PATH=%PATH%;%My_PATH%
md .\bak\ 2>nul 
setlocal enabledelayedexpansion
::列出已装的app

for /f "usebackq delims=:== tokens=2,3,4" %%i in (`adb shell pm list packages -f -3`) do (
	if "%%k"=="" (set P=%%j) else (set P=%%k) 
	ECHO !P!>>1.TXT
	for %%i in (.\bak\*!P!.apk) do ECHO !P!>>2.TXT
)
for /f "delims=" %%i in ('findstr /g:2.TXT /v 1.TXT 2^>nul') do echo %%i
del 1.TXT 2>nul 
del 2.TXT 2>nul 

pause