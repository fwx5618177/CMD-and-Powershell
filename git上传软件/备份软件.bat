@echo off && setlocal enabledelayedexpansion

:start
echo.
echo 选择你的目的：
echo.
echo 1.初始化(首次使用，请先选择此处进行初始化)
echo 2.查看状态(status)
echo 3.保存新文件(仅保存文件)
echo 4.保存到云端(备份到云端)
echo 5.自动化保存新文件，并放到云端保存(省略1-4步骤,不适用第一次使用)
echo 6.文件丢失后找回
echo 7.新电脑文件取回原有文件
echo 8.设置云端的配置
echo 0.点错，退出
echo.


:select
set /p select=选择：

IF /I "%select%"=="1" GOTO s1
IF /I "%select%"=="2" GOTO s2
IF /I "%select%"=="3" GOTO s3
IF /I "%select%"=="4" GOTO s4
IF /I "%select%"=="5" GOTO s5
IF /I "%select%"=="6" GOTO s6
IF /I "%select%"=="7" GOTO s7
IF /I "%select%"=="8" GOTO s8
IF /I "%select%"=="0" GOTO s0

ECHO 选择无效，请重新输入 
ECHO.
GOTO select

:s1
git init

REM add master branch
git switch -c master
git switch -c dev

REM auto-add files
git add . 
git commit -am "initial"

REM merge master
git switch master
git merge dev

REM switch dev
git switch dev

echo 初始化完成

goto start

:s2
echo 当前状态：
git status
echo.
pause
echo 如果存在红色提示,请选择3进行保存
goto start

:s3
for /f "tokens=3 delims=^ " %%a in ('git status ^| findstr /I "on branch"') do ( 
	if "%%a" EQU "master" (
		git switch dev
	)	
)

echo 请在下面输入更改文件的信息
set /p "str=本次保存需要记录的信息:"
git add .
git commit -am "%str%"
echo.
git status
echo 已保存,请查看是否出现"nothing to commit, working tree clean"字样
goto start

:s4
echo 备份到云端
git switch dev
for /f "tokens=3 delims=^ " %%a in ('git status ^| findstr /I "on branch"') do ( 
	if "%%a" EQU "dev" (
		git switch master
		git merge dev
	)
	
	if "%%a" EQU "master" (
		git merge dev
	)	
)

git push origin master
echo 查看最后一行是否出现" master-> master"字样
echo 如果出现为"fatal"，则传输失败
echo 传输完成,请按下任意键
pause>nul
git switch dev
git status
echo 查看branch是否为dev
goto start

:s5

for /f "tokens=3 delims=^ " %%a in ('git status ^| findstr /I "on branch"') do ( 
	if "%%a" EQU "master" (
		git switch dev
	)
)

set /A addCount = 0

REM add
for /f %%a in ('git status ^| findstr /I "^untracked files"') do (
	echo %%a
	set /A addCount+=1
)

REM commit, modify
for /f %%a in ('git status ^| findstr /I "^Changes to be committed"') do (
	echo %%a
	set /A addCount+=1
)

echo %addCount%

set /p "str=本次保存需要记录的信息:"
if %addCount% GEQ 1 (

	git add .
	git commit -am "%str%"
) else  (
	echo 没有文件修改
)

git switch master
git merge dev

git push origin master
echo 查看最后一行是否出现" master-> master"字样
echo 如果出现为"fatal"，则传输失败
echo 传输完成,请按下任意键
pause>nul


git switch dev
git status
echo 查看branch是否为dev
goto start

:s6
for /f "tokens=3 delims=^ " %%a in ('git status ^| findstr /I "on branch"') do ( 
	if "%%a" EQU "master" (
		git switch dev
		
	)
)

git reset --hard HEAD~1

choice /M "是否找回文件？" /C yn
echo %errorlevel%
if '%errorlevel%'=='1' goto start
if '%errorlevel%'=='2' goto s6
goto start

:s7
set /p "url=输入链接:"
git clone %url%

for /f "tokens=3 delims=^ " %%a in ('git status ^| findstr /I "on branch"') do ( 
	if "%%a" EQU "master" (
		git switch dev
		
	)
)
echo 取回成功
goto start

:s8
echo 增加远程仓库
set /p name=输入仓库名字：
set /p url=输入仓库链接：
git remote add %name% %url%
echo.
echo 成功,按任意键返回
pause>nul
goto start


:s0
exit