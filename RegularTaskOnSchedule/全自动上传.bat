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

echo ȫ�Զ��ϴ�

::�õ�Ŀ¼����
for /f "tokens=4 delims=\ " %%i in ('dir ^| findstr /c:"%date:~0,10%" ^| findstr /v /c:"\."') do (
	echo %%i>>list.txt
)

::�õ��ļ�����������
for /f %%i in (list.txt) do (
	
	cd %%i

	::��ȡ�����ļ���
	for /f "tokens=4 delims=\ " %%a in ('dir ^| findstr /c:"%date:~0,10%" ^| 	findstr /v /c:"DIR"') do (
		echo %%a >> ..\fileList.txt
	) 
	cd ..
)


::git add .
::����ļ�������
for /f %%i in (list.txt) do (
	git add %%i
	cd %%i
	::��ȡ�����ļ���
	::git commit -am "%str%"
	::����޸���Ϣ
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
	echo Զ�ֿ̲����֣�%%i
	set repoName=%%i
)

for /f "tokens=1,2* delims=\ " %%i in ('git branch') do (
	echo �汾��%%j
	set branch=%%j
)

echo !repoName!
echo !branch!

git push !repoName! !branch!

echo.
echo �ϴ����

