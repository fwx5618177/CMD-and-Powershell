@echo off  
title IP切换脚本

:start
@echo --------------------------------- 
@echo 请选择更改IP的方式: 
@echo 1.启用DHCP
@echo 2.指定IP
@echo --------------------------------- 


@echo ----------------------------------
@echo 当前网络适配器状态：
netsh interface show interface
@echo ----------------------------------

choice /c:yn /d y /m "是否自动处理(默认为最后一个适配器[默认执行yes])（y,n）" /t 30


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
set /p interface=选择更改的网络适配器:

goto menu

:menu
choice /c:12 /d 1 /M "选择更改IP的方式：1,2（[默认执行DHCP]）" /t 30

if %ERRORLEVEL%==1 goto s1 
if %ERRORLEVEL%==2 goto s2
@echo 选择错误，请重新选择 
goto menu

:s1 
@echo 正在设置无线网络连接为DHCP模式 
netsh interface ip set address name="%interface%" source=dhcp
netsh interface ip set dns name="%interface%" source=dhcp

ipconfig /release
ipconfig /renew

goto end 

:s2

@echo 正在设置无线网络连接为指定模式 

set /p ipstr=输入改变IP:
if "%ipstr%"=="" goto s2

set /p maskstr=输入改变subnet mask:
if "%maskstr%"=="" goto s2

set /p gatewaystr=输入改变的gateway:
if "%gatewaystr%"=="" goto s2

set /p dnsstr=输入改变dns:
if "%dnsstr%"=="" goto s2

set /p dnsstrbak=输入备用dns:
if "%dnsstrbak%"=="" goto s2

@echo 正在设置无线网络连接为固定IP:%ipstr% 

netsh interface ip set address name="%interface%" source=static addr=%ipstr% mask=%maskstr% gateway=%gatewaystr% gwmetric=1

netsh interface ip set dns name="%interface%" source=static addr=%dnsstr% register=PRIMARY validate=no

netsh interface ip add dns "%interface%" %dnsstrbak% index=2 no

goto end

:end 
echo 设置完成

ipconfig /flushdns

choice /c:yn /d y /M "是否退出：y,n（[默认执行yes]）" /t 30

if %ERRORLEVEL%==1 goto exit 
if %ERRORLEVEL%==2 goto start

goto end

:exit
echo 自动退出
exit
