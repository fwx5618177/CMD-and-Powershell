@echo off
:start
set num=
set bak=
set n=
set o=
set /p num=input:
set bak=%num%
:loop
set /a n=num%%2
set /a num=num/2
set o=%n%%o%
if not %num% equ 0 goto loop
cls
echo ʮ���ƣ� %bak%
echo �����ƣ� %o%
pause
cls
goto start