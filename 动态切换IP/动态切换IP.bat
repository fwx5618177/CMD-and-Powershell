@echo off  
title IP�л��ű�

:start
@echo --------------------------------- 
@echo ��ѡ�����IP�ķ�ʽ: 
@echo 1.����DHCP
@echo 2.ָ��IP
@echo --------------------------------- 


@echo ----------------------------------
@echo ��ǰ����������״̬��
netsh interface show interface
@echo ----------------------------------

choice /c:yn /d y /m "�Ƿ��Զ�����(Ĭ��Ϊ���һ��������[Ĭ��ִ��yes])��y,n��" /t 30


if %ERRORLEVEL%==1 goto m1
if %ERRORLEVEL%==2 goto m2

goto start

:m1
for /f "tokens=1,4,* delims=\ " %%i in ('netsh interface show interface') do (
	set status=%%i
	set interface=%%j %%k
)

echo %status% ---- %interface%
goto menu

:m2
set /p interface=ѡ����ĵ�����������:

goto menu

:menu
choice /c:12 /d 1 /M "ѡ�����IP�ķ�ʽ��1,2��[Ĭ��ִ��DHCP]��" /t 30

if %ERRORLEVEL%==1 goto s1 
if %ERRORLEVEL%==2 goto s2
@echo ѡ�����������ѡ�� 
goto menu

:s1 
@echo ��������������������ΪDHCPģʽ 
netsh interface ip set address name="%interface%" source=dhcp
netsh interface ip set dns name="%interface%" source=dhcp

ipconfig /release
ipconfig /renew

goto end 

:s2

@echo ��������������������Ϊָ��ģʽ 

set /p ipstr=����ı�IP:
if "%ipstr%"=="" goto s2

set /p maskstr=����ı�subnet mask:
if "%maskstr%"=="" goto s2

set /p gatewaystr=����ı��gateway:
if "%gatewaystr%"=="" goto s2

set /p dnsstr=����ı�dns:
if "%dnsstr%"=="" goto s2

set /p dnsstrbak=���뱸��dns:
if "%dnsstrbak%"=="" goto s2

@echo ��������������������Ϊ�̶�IP:%ipstr% 

netsh interface ip set address name="%interface%" source=static addr=%ipstr% mask=%maskstr% gateway=%gatewaystr% gwmetric=1

netsh interface ip set dns name="%interface%" source=static addr=%dnsstr% register=PRIMARY validate=no

netsh interface ip add dns "%interface%" %dnsstrbak% index=2 no

goto end

:end 
echo �������

ipconfig /flushdns

choice /c:yn /d y /M "�Ƿ��˳���y,n��[Ĭ��ִ��yes]��" /t 30

if %ERRORLEVEL%==1 goto exit 
if %ERRORLEVEL%==2 goto start

goto end

:exit
echo �Զ��˳�
exit
