@echo off

set /p str=输入字符串：
set str1=%str%
:next1
if not "%str%"==""(
	set /a num+=1
	set "str=%%"
)