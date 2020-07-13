@echo off
REM 获取当前路径下的所有文件名

echo *****************************
echo.
echo                   start
echo.
echo *****************************

dir /b > list.txt

for /f "tokens=*" %%a in (list.txt) do (
	echo ^<link rel^=^'stylesheet^' href^=^'./css/%%a'^> >> result.txt
)

del list.txt

type result.txt

echo *****************************
echo.
echo                   over
echo.
echo *****************************

pause