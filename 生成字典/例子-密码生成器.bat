cls &@echo off & color 0a & title �����ֵ����ɼ򵥹��� Made By �������

:INPUT
cls & mode con cols=62 lines=30 & color 74
echo  ������������������������������������������������������������
echo                    �����ֵ����ɹ���v1.0
echo  ----------------------------------------------------
echo  ����
echo              n:��ʼ����                
echo              a:�汾˵��
echo  ������������������������������������������������������������
set /p In= ���������
set In=%In:~0,1%
if  #%In% ==#n goto SHENG
if  #%In% ==#a goto README
echo �����˴������,������.
goto INPUT


:SHENG
echo  �����������ֵ�Ŀ����ַ�(ÿ���ַ����ÿո����)
set /p N= ��(1a k ab 0 888):
echo  ���������ɵ������ֵ�λ��(����Ϊ3λ,��Ȼû��˼)
set /p Z= (��8):
if %Z% gtr 10 (goto YUN
) else (
goto %Z%)

:1
echo һλ�����룿��Ҳ̫���˰ɣ�
goto INPUT

:2
echo ��λ�����룿��Ҳ̫�����˰ɣ�
goto INPUT

:3
echo �����ĵȴ�,����ǳ���Ŷ!
FOR %%a in (%N%) do (
FOR %%b in (%N%) do (
FOR %%c in (%N%) do (
echo %%a%%b%%c
echo %%a%%b%%c>>3.dic
)))
echo �����ֵ��ļ�3.dic�������! &  
goto INPUT

:4
echo �����ĵȴ�,����ǳ���Ŷ!
FOR %%a in (%N%) do (
FOR %%b in (%N%) do (
FOR %%c in (%N%) do (
FOR %%d in (%N%) do (
echo %%a%%b%%c%%d
echo %%a%%b%%c%%d>>4.dic
))))
echo �����ֵ��ļ�4.dic�������! &  
goto INPUT

:5
echo �����ĵȴ�,����ǳ���Ŷ!
FOR %%a in (%N%) do (
FOR %%b in (%N%) do (
FOR %%c in (%N%) do (
FOR %%d in (%N%) do (
FOR %%e in (%N%) do (
echo %%a%%b%%c%%d%%e
echo %%a%%b%%c%%d%%e>>5.dic
)))))
echo �����ֵ��ļ�5.dic�������! &  
goto INPUT

:6
echo �����ĵȴ�,��Ҫһ��ʱ��Ŷ!
FOR %%a in (%N%) do (
FOR %%b in (%N%) do (
FOR %%c in (%N%) do (
FOR %%d in (%N%) do (
FOR %%e in (%N%) do (
FOR %%f in (%N%) do (
echo %%a%%b%%c%%d%%e%%f
echo %%a%%b%%c%%d%%e%%f>>6.dic
))))))
echo �����ֵ��ļ�6.dic�������! &  
goto INPUT

:7
echo �����ĵȴ�,��Ҫһ��ʱ��Ŷ!
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
echo �����ֵ��ļ�7.dic�������! &  
goto INPUT

:8
echo �����ĵȴ�,ʱ����ܱȽϳ�Ŷ!
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
echo �����ֵ��ļ�8.dic�������! &  
goto INPUT

:9
echo �����ĵȴ�,ʱ��Ƚϳ�Ŷ,�����������ƽ���ܲ�������!
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
echo �����ֵ��ļ�9.dic�������! &  
goto INPUT

:10
echo �����ĵȴ�,ʱ��ܳ�Ŷ,�����������ƽⲻ������!
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
echo �����ֵ��ļ�10.dic�����������! &  
goto INPUT

:YUN
echo.
echo �������б����ƽ⻹��������,��Ҳ������! ���ҿɲ���! ��Ҳ��ɵ��!BYEBYE!  
goto INPUT

:README
echo.
echo  ========================================================
echo  ===                       ���ڱ�����                 ===
echo  ========================================================
echo  ==                                                     =
echo  ==                                                     =
echo  == ����������Ч�ʲ����ߣ����������Ҫʹ�������ֵ��ʱ��=
echo  == �����ʹ�ñ�������ʱ���棬����ϣ����һ��ǲ�Ҫ�ñ���=
echo  == ���ƽ�ʲô����Ŷ������ѧϰ���������е��κη�������  =
echo  ==                                                     =
echo  ==                                                     =
echo  ==                                           �������  =
echo  ==                                    www.guijiang.cn  =
echo  ==                                    2007.11.11 6:19  =
echo  ==                                                     =
echo  ========================================================
goto INPUT