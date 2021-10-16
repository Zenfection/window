@echo off

title Install EVkey
SET tag=1.1
SET ver=4.3.7
SET home=C:\ToolZen
SET desktop=C:\Users\%username%\Desktop
SET cur=%cd%

goto check
goto install
goto delete
goto sucess
goto end


:check 
if exist "C:\EVKey\EVKey64.exe" goto checkVer

:checkVer
"%home%\sigcheck.exe" -accepteula -nobanner -n "C:\EVKey\EVKey64.exe" > temp.txt
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
sudo copy "C:\EVkey\EVkey.lnk" "%desktop%\EVkey.lnk"
sudo move "C:\EVkey\EVkey.lnk"  "C:\ProgramData\Microsoft\Windows\Start Menu\Programs"

:delete
cd "%desktop%"
if exist EVKey.zip powershell rm -r EVKey.zip
if exist EVKey powershell rm -r EVKey


:success
if exist "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\EVKey.lnk"(
    echo Install EVkey Successful, Open it in Desktop
    goto end
) else (
    echo Install Failed, Let tell me !!!!
    goto end
) 

:end
echo Press any key to quit...
pause >nul
if exist "%cur%\evkey.bat" del "%cur%\evkey.bat" 