@echo off && setlocal enabledelayedexpansion

cd ..

dir | findstr /c:"%date:~0,10%" | findstr /v /c:"\."

::得到目录数据
for /f "tokens=4 delims=\ " %%i in ('dir ^| findstr /c:"%date:~0,10%" ^| findstr /v /c:"\."') do (
	set /a count+=1
	echo !count!
	set "num=%%i"
	echo %%i>>list.txt
)

pause

::得到目录数据2
for /f "tokens=4 delims=\ " %%i in ('dir ^| findstr /c:"%date:~0,10%" ^| findstr /v /c:"\."') do (

	set /p num=%%i<nul
	echo * !num!
)

pause

::一行数据表示总体
(for /f %%i in ('type list.txt') do (

	set /p="%%i,"<nul
)) > tmp.list

for /f %%i in ('type tmp.list') do (
	set str=%%i
	set str=!str:~,-1!
	)

echo %str%

del list.txt

del tmp.list

pause > nul





