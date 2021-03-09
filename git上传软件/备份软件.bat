@echo off && setlocal enabledelayedexpansion

:start
echo.
echo ѡ�����Ŀ�ģ�
echo.
echo 1.��ʼ��(�״�ʹ�ã�����ѡ��˴����г�ʼ��)
echo 2.�鿴״̬(status)
echo 3.�������ļ�(�������ļ�)
echo 4.���浽�ƶ�(���ݵ��ƶ�)
echo 5.�Զ����������ļ������ŵ��ƶ˱���(ʡ��1-4����,�����õ�һ��ʹ��)
echo 6.�ļ���ʧ���һ�
echo 7.�µ����ļ�ȡ��ԭ���ļ�
echo 8.�����ƶ˵�����
echo 0.����˳�
echo.


:select
set /p select=ѡ��

IF /I "%select%"=="1" GOTO s1
IF /I "%select%"=="2" GOTO s2
IF /I "%select%"=="3" GOTO s3
IF /I "%select%"=="4" GOTO s4
IF /I "%select%"=="5" GOTO s5
IF /I "%select%"=="6" GOTO s6
IF /I "%select%"=="7" GOTO s7
IF /I "%select%"=="8" GOTO s8
IF /I "%select%"=="0" GOTO s0

ECHO ѡ����Ч������������ 
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

echo ��ʼ�����

goto start

:s2
echo ��ǰ״̬��
git status
echo.
pause
echo ������ں�ɫ��ʾ,��ѡ��3���б���
goto start

:s3
for /f "tokens=3 delims=^ " %%a in ('git status ^| findstr /I "on branch"') do ( 
	if "%%a" EQU "master" (
		git switch dev
	)	
)

echo ����������������ļ�����Ϣ
set /p "str=���α�����Ҫ��¼����Ϣ:"
git add .
git commit -am "%str%"
echo.
git status
echo �ѱ���,��鿴�Ƿ����"nothing to commit, working tree clean"����
goto start

:s4
echo ���ݵ��ƶ�
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
echo �鿴���һ���Ƿ����" master-> master"����
echo �������Ϊ"fatal"������ʧ��
echo �������,�밴�������
pause>nul
git switch dev
git status
echo �鿴branch�Ƿ�Ϊdev
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

set /p "str=���α�����Ҫ��¼����Ϣ:"
if %addCount% GEQ 1 (

	git add .
	git commit -am "%str%"
) else  (
	echo û���ļ��޸�
)

git switch master
git merge dev

git push origin master
echo �鿴���һ���Ƿ����" master-> master"����
echo �������Ϊ"fatal"������ʧ��
echo �������,�밴�������
pause>nul


git switch dev
git status
echo �鿴branch�Ƿ�Ϊdev
goto start

:s6
for /f "tokens=3 delims=^ " %%a in ('git status ^| findstr /I "on branch"') do ( 
	if "%%a" EQU "master" (
		git switch dev
		
	)
)

git reset --hard HEAD~1

choice /M "�Ƿ��һ��ļ���" /C yn
echo %errorlevel%
if '%errorlevel%'=='1' goto start
if '%errorlevel%'=='2' goto s6
goto start

:s7
set /p "url=��������:"
git clone %url%

for /f "tokens=3 delims=^ " %%a in ('git status ^| findstr /I "on branch"') do ( 
	if "%%a" EQU "master" (
		git switch dev
		
	)
)
echo ȡ�سɹ�
goto start

:s8
echo ����Զ�ֿ̲�
set /p name=����ֿ����֣�
set /p url=����ֿ����ӣ�
git remote add %name% %url%
echo.
echo �ɹ�,�����������
pause>nul
goto start


:s0
exit