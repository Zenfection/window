@echo off

title Install EVkey
SET tag=2.0
SET ver=4.3.7
SET home=C:\ToolZen
SET desktop=C:\Users\%username%\Desktop
SET cur=%cd%


if not exist "C:\EVKey\EVKey64.exe" (
    goto install
    goto delete
    goto end
) else (
    goto checkVer
)


:check 
if exist "C:\EVKey\EVKey64.exe" goto checkVer


:checkVer
%home%\sigcheck.exe -accepteula -nobanner -n "C:\EVKey\EVKey64.exe" > temp.txt
set /p currentVer=<temp.txt
del temp.txt
rem can change version
set currentVer=%currentVer:~0,5%
if %currentVer% == %ver% (
    echo EVKey installed newest version !!!
    goto end
)

:install
cd "%desktop%"
curl https://github.com/Zenfection/window/releases/download/%tag%/EVKey.zip -O -L
if not exist C:\EVKey mkdir C:\EVKey
powershell -Command "Expand-Archive EVKey.zip -DestinationPath C:\EVKey"
copy "C:\EVkey\EVkey.lnk" "%desktop%\EVkey.lnk"
move "C:\EVkey\EVkey.lnk"  "C:\ProgramData\Microsoft\Windows\Start Menu\Programs"

:delete
cd "%desktop%"
if exist EVKey.zip powershell rm -r EVKey.zip
if exist EVKey powershell rm -r EVKey

:end
echo Press any key to quit...
pause >nul
if exist "%cur%\evkey.bat" del "%cur%\evkey.bat" 