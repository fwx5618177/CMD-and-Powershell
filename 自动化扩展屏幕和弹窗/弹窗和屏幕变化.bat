@echo off && setlocal enabledelayedexpansion

set /a a=10
set /a b=5

:tex
set /a a+=3
set /a b+=1
mode con cols=%a% lines=%b%
if %a% lss 100 goto tex

echo Merry Christmas.
set a=15,a6,2e,e0,34,8b,4f,9d,5e,a0

for /l %%a in (1,1,1) do (
	for %%i in (%a%) do (
		ping -n 2 127.1>nul
		color %%i
	)
)

for /l %%a in (1,1,300) do (
	for %%i in (%a%,%a%) do (
		ping -n 1 127.1>nul
		color %%i
	)
)

>>ms.txt echo hhhh
>>ms.txt echo wwww
>>ms.txt echo vvvv

msg %username% /w /time:3600 < ms.txt
del ms.txt
pause