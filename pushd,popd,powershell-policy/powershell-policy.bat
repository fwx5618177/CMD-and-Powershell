##�����BAT�е���powershell��������������Ϊbat��ʽ
pushd %cd%
powershell.exe -command ^
  "& {set-executionpolicy Remotesigned -Scope Process; .'.\ClearIISLogFiles.ps1' }"
popd
pause