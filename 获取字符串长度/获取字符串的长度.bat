@echo off

set /p input=�����ַ�����
set str=%input%

set /a num=0
:next1
if not "%str%"=="" (
	set /a num+=1
	@echo %str:~0,1%
	set "str=%str:~1%"
	goto next1
)

echo �ַ����ĳ���Ϊ��%num% && pause > nul