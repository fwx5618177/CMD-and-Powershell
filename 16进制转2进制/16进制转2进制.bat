@echo off && setlocal enabledelayedexpansion

:start
set num=
set bak=
set n=
set 0=
set /p num=input��
set init=%num%
set /a num=0x%num%
set bak=%num%

:loop
set /a n=num%%2
set /a num=num/2
set o=%n%%o%
if not %num% equ 0 goto loop
cls
echo �����ַ�����ʮ�����ƣ���%init%
echo ʮ����: %bak%
echo �����ƣ�%o%
pause>nul
goto start

