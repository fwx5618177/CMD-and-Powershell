@echo off
setlocal enabledelayedexpansion

D:
set "envFile=D:\codedata\CMD\RegularTaskOnSchedule\env.txt"
set /a count=0
for /f %%i in (%envFile%) do (
	set /a count+=1
	if !count!==1 set pathStr=%%i
)

cd !pathStr!

echo !pathStr!

echo 全自动上传

::得到目录数据
for /f "tokens=4 delims=\ " %%i in ('dir ^| findstr /c:"%date:~0,10%" ^| findstr /v /c:"\."') do (
	echo %%i>>list.txt
)

::得到文件的新增数据
for /f %%i in (list.txt) do (
	
	cd %%i

	::获取新增文件名
	for /f "tokens=4 delims=\ " %%a in ('dir ^| findstr /c:"%date:~0,10%" ^| 	findstr /v /c:"DIR"') do (
		echo %%a >> ..\fileList.txt
	) 
	cd ..
)


::git add .
::逐个文件夹增加
for /f %%i in (list.txt) do (
	git add %%i
	cd %%i
	::获取新增文件名
	::git commit -am "%str%"
	::添加修改信息
	for /f "tokens=4 delims=\ " %%a in ('dir ^| findstr /c:"%date:~0,10%" ^| findstr /v /c:"DIR"') do (
		echo %%a
		git commit -m "add func: %%a in %date:~0,10%-%time%" %%a
	)
	cd ..
	
)

type list.txt >> UploadLog.txt
echo %date:~0,10%-%time% >> UploadLog.txt
echo. >> UploadLog.txt
type fileList.txt >> UploadLog.txt
echo %date:~0,10%-%time% >> UploadLog.txt
echo. >> UploadLog.txt

del list.txt fileList.txt



for /f %%i in ('git remote') do (
	echo 远程仓库名字：%%i
	set repoName=%%i
)

for /f "tokens=1,2* delims=\ " %%i in ('git branch') do (
	echo 版本：%%j
	set branch=%%j
)

echo !repoName!
echo !branch!

git push !repoName! !branch!

echo.
echo 上传完成

