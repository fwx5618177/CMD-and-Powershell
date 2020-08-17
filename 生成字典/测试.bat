cls &@echo off & color 0a & title 密码字典生成简单工具 Made By 飞速如风

:INPUT
cls & mode con cols=62 lines=30 & color 74
echo  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
echo                    密码字典生成工具v1.0
echo  ----------------------------------------------------
echo  命令
echo              n:开始工作                
echo              a:版本说明
echo  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
set /p In= 请输入命令：
set In=%In:~0,1%
if  #%In% ==#n goto SHENG
if  #%In% ==#a goto README
echo 输入了错误参数,请重试.
goto INPUT


:SHENG
echo  请输入密码字典的可能字符(每条字符请用空格隔开)
set /p N= 如(1a k ab 0 888):
echo  请输入生成的密码字典位数(最少为3位,不然没意思)
set /p Z= (如8):
if %Z% gtr 10 (goto YUN
) else (
goto %Z%)

:1
echo 一位的密码？你也太搞了吧？
goto INPUT

:2
echo 两位的密码？你也太弱智了吧？
goto INPUT

:3
echo 请耐心等待,不会非常大哦!
FOR %%a in (%N%) do (
FOR %%b in (%N%) do (
FOR %%c in (%N%) do (
echo %%a%%b%%c
echo %%a%%b%%c>>3.dic
)))
echo 密码字典文件3.dic生成完毕! &  
goto INPUT

:4
echo 请耐心等待,不会非常大哦!
FOR %%a in (%N%) do (
FOR %%b in (%N%) do (
FOR %%c in (%N%) do (
FOR %%d in (%N%) do (
echo %%a%%b%%c%%d
echo %%a%%b%%c%%d>>4.dic
))))
echo 密码字典文件4.dic生成完毕! &  
goto INPUT

:5
echo 请耐心等待,不会非常大哦!
FOR %%a in (%N%) do (
FOR %%b in (%N%) do (
FOR %%c in (%N%) do (
FOR %%d in (%N%) do (
FOR %%e in (%N%) do (
echo %%a%%b%%c%%d%%e
echo %%a%%b%%c%%d%%e>>5.dic
)))))
echo 密码字典文件5.dic生成完毕! &  
goto INPUT

:6
echo 请耐心等待,需要一点时间哦!
FOR %%a in (%N%) do (
FOR %%b in (%N%) do (
FOR %%c in (%N%) do (
FOR %%d in (%N%) do (
FOR %%e in (%N%) do (
FOR %%f in (%N%) do (
echo %%a%%b%%c%%d%%e%%f
echo %%a%%b%%c%%d%%e%%f>>6.dic
))))))
echo 密码字典文件6.dic生成完毕! &  
goto INPUT

:7
echo 请耐心等待,需要一点时间哦!
FOR %%a in (%N%) do (
FOR %%b in (%N%) do (
FOR %%c in (%N%) do (
FOR %%d in (%N%) do (
FOR %%e in (%N%) do (
FOR %%f in (%N%) do (
FOR %%g in (%N%) do (
echo %%a%%b%%c%%d%%e%%f%%g
echo %%a%%b%%c%%d%%e%%f%%g>>7.dic
)))))))
echo 密码字典文件7.dic生成完毕! &  
goto INPUT

:8
echo 请耐心等待,时间可能比较长哦!
FOR %%a in (%N%) do (
FOR %%b in (%N%) do (
FOR %%c in (%N%) do (
FOR %%d in (%N%) do (
FOR %%e in (%N%) do (
FOR %%f in (%N%) do (
FOR %%g in (%N%) do (
FOR %%h in (%N%) do (
echo %%a%%b%%c%%d%%e%%f%%g%%h
echo %%a%%b%%c%%d%%e%%f%%g%%h>>8.dic
))))))))
echo 密码字典文件8.dic生成完毕! &  
goto INPUT

:9
echo 请耐心等待,时间比较长哦,用来做暴力破解可能不划来啊!
FOR %%a in (%N%) do (
FOR %%b in (%N%) do (
FOR %%c in (%N%) do (
FOR %%d in (%N%) do (
FOR %%e in (%N%) do (
FOR %%f in (%N%) do (
FOR %%g in (%N%) do (
FOR %%h in (%N%) do (
FOR %%i in (%N%) do (
echo %%a%%b%%c%%d%%e%%f%%g%%h%%i
echo %%a%%b%%c%%d%%e%%f%%g%%h%%i>>9.dic
)))))))))
echo 密码字典文件9.dic生成完毕! &  
goto INPUT

:10
echo 请耐心等待,时间很长哦,用来做暴力破解不划来啊!
FOR %%a in (%N%) do (
FOR %%b in (%N%) do (
FOR %%c in (%N%) do (
FOR %%d in (%N%) do (
FOR %%e in (%N%) do (
FOR %%f in (%N%) do (
FOR %%g in (%N%) do (
FOR %%h in (%N%) do (
FOR %%i in (%N%) do (
FOR %%j in (%N%) do (
echo %%a%%b%%c%%d%%e%%f%%g%%h%%i%%j
echo %%a%%b%%c%%d%%e%%f%%g%%h%%i%%j>>10.dic
))))))))))
echo 密码字典文件10.dic终于生成完毕! &  
goto INPUT

:YUN
echo.
echo 这样进行暴力破解还不累死你,我也累死了! 这我可不干! 你也别傻了!BYEBYE!  
goto INPUT

:README
echo.
echo  ========================================================
echo  ===                       关于本工具                 ===
echo  ========================================================
echo  ==                                                     =
echo  ==                                                     =
echo  == 本工具生成效率并不高，如果您在需要使用密码字典的时　=
echo  == 候可以使用本工具临时代替，不过希望大家还是不要用暴　=
echo  == 力破解什么密码哦，纯粹学习交流，不承担任何法律责任  =
echo  ==                                                     =
echo  ==                                                     =
echo  ==                                           飞速如风  =
echo  ==                                    www.guijiang.cn  =
echo  ==                                    2007.11.11 6:19  =
echo  ==                                                     =
echo  ========================================================
goto INPUT