

for /f "tokens=1,2* delims=\ " %%i in ('tasklist^|findstr /i cmd') do (
	echo %%j
)