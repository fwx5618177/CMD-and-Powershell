@echo off

set /p input=输入字符串：
set str=%input%

set /a num=0
:next1
if not "%str%"=="" (
	set /a num+=1
	@echo %str:~0,1%
	set "str=%str:~1%"
	goto next1
)

echo 字符串的长度为：%num% && pause > nul