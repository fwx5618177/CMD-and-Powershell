@echo off
title 根据MAC地址修改计算机名批处理,支持XP/Win7/Win8.1/Win10操作系统，Edit by 杰森网络
echo ****************************************************************************
echo     温馨提示1：请根据自己的实际情况，按指定格式编辑本批处理后面的用户信息。
echo     温馨提示2：如有安全类软件拦截，请允许运行。
echo     温馨提示3: win8.1系统请右键选择以管理员身份运行，否则会报错。
echo ****************************************************************************
@ping 127.1 -n  1  >nul

::*************** 1.获取本机MAC地址，并在外置文本信息中找匹配项 ***************
cd /d %~dp0
for /f "tokens=1-4 delims=," %%i in ('getmac /v /fo csv') do find /i %%k %0 >nul &&set Ethernet=%%i&&set Adapter=%%j&&set MAC=%%k &&goto true
echo 未找到匹配MAC项，本程序在3秒后退出&del a.txt   >nul&@ping 127.0.0.1 -n  3  >nul &exit
:true

::*************** 2.去掉MAC地址的空格和引号 ***************
set "MAC=%MAC: =%"
set MAC=%MAC:"=%
set Ethernet=%Ethernet:"=%
set Adapter=%Adapter:"=%

:: *************** 3.信息汇总 ***************
for /f "tokens=1-8" %%i in ('find /i "%mac%" %0') do set "name=%%i"

echo ****************************************************************************
echo  本机预设信息，1秒后自动应用修改，如有错误，请关闭本窗口手动修改
echo ****************************************************************************
echo          计算机名：       %name%	(当前名称：%computername%)
echo          网络名称         %Ethernet%
echo          适配器名称       %Adapter%
echo          本机MAC地址      %mac%
echo ****************************************************************************

:: *************** 4.修改配置 ***************
@ping 127.1 -n  1  >nul
echo 1.正在修改计算机名……
echo REGEDIT4 >c:\windows\reg.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\ComputerName] >> c:\windows\reg.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName] >> c:\windows\reg.reg 
echo "ComputerName"="%name%" >> c:\windows\reg.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\ComputerName\ActiveComputerName] >> c:\windows\reg.reg 
echo "ComputerName"="%name%" >> c:\windows\reg.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Control\ComputerName\ComputerName] >> c:\windows\reg.reg 
echo "ComputerName"="%name%" >> c:\windows\reg.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters] >> c:\windows\reg.reg 
echo "NV Hostname"="%name%" >> c:\windows\reg.reg 
echo "Hostname"="%name%" >> c:\windows\reg.reg
echo [HKEY_USERS\S-1-5-18\Software\Microsoft\Windows\ShellNoRoam] >> c:\windows\reg.reg 
echo @="%name%" >> c:\windows\reg.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\ComputerName\ActiveComputerName] >> c:\windows\reg.reg 
echo "ComputerName"="%name%" >> c:\windows\reg.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Tcpip\Parameters] >> c:\windows\reg.reg 
echo "NV Hostname"="%name%" >> c:\windows\reg.reg 
echo "Hostname"="%name%" >> c:\windows\reg.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon] >> c:\windows\reg.reg 
echo "DefaultDomainName"="%name%" >> c:\windows\reg.reg 
echo "AltDefaultDomainName"="%name%" >> c:\windows\reg.reg
regedit /s c:\windows\reg.reg 
echo 所有操作已经完成,立即生效。本批处理3秒后自动退出，感谢你的使用，如有问题，请反馈。
@ping 127.1 -n  3  >nul&del %0



::计算机名	MAC地址
A001	0A-E0-AF-A7-6D-9B