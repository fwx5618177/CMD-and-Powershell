##如何在BAT中调用powershell，把下面代码另存为bat格式
pushd %cd%
powershell.exe -command ^
  "& {set-executionpolicy Remotesigned -Scope Process; .'.\ClearIISLogFiles.ps1' }"
popd
pause