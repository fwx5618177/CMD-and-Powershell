@echo off && setlocal enabledelayedexpansion

:start
set num=
set bak=
set n=
set 0=
set /p num=input：
set init=%num%
set /a num=0x%num%
set bak=%num%

:loop
set /a n=num%%2
set /a num=num/2
set o=%n%%o%
if not %num% equ 0 goto loop
cls
echo 输入字符串（十六进制）：%init%
echo 十进制: %bak%
echo 二进制：%o%
pause>nul
goto start

