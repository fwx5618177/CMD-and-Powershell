@echo off

set /p str=�Ƿ�������

if /I "%str%" == "y"  (
	goto restart
) ELSE (
	goto exit
)

:restart
shutdown /r

:exit
exit