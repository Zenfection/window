@echo off

SET ver=4.22.0
SET cur=%cd%
SET tag=1.1
SET home=C:\ToolZen
SET desktop=C:\Users\%username%\Desktop


goto check
goto install
goto active
goto delete
goto end

:check
if exist "C:\Program Files (x86)\Mirillis\Action!\Action.exe" goto checkVer

:checkVer
rem 4, 22, 0, 0
%home%\sigcheck.exe -accepteula -nobanner -n  "C:\Program Files (x86)\Mirillis\Action!\Action.exe" > temp.txt
set /p currentVer=<temp.txt
set currentVer=%currentVer: =%
set currentVer=%currentVer:,=.%
del temp.txt
rem --can change version--
set currentVer=%currentVer:~0,6% 
if %currentVer% == %ver% (
   echo Action Video installed newest version !!!
   goto end
)

:install
cd "%desktop%"
curl https://github.com/Zenfection/window/releases/download/%tag%/action.zip -O -L
powershell -Command "Expand-Archive action.zip"
action\Setup.exe

:active
cd "%desktop%"
sudo move action\Action_Loader.exe "C:\Program Files (x86)\Mirillis\Action!"
sudo copy action\active\Action!.lnk "%desktop%\Action!.lnk"
sudo move action\active\Action!.lnk "C:\Users\zen\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Mirillis\Action!"

:delete
if exist action.zip powershell rm -r active.zip
if exist action powershell rm -r active

:end
echo Press any key to quit...
pause >nul
exit