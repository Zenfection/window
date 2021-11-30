@echo off

SET tag=1.1
SET ver=4.5.0
SET cur=%cd%
SET home=C:\ToolZen
SET desktop=C:\Users\%username%\Desktop

goto check
goto install
goto active
goto delete
goto end


:check
if exist "C:\Program Files\VS Revo Group\Revo Uninstaller Pro\RevoUninPro.exe" goto checkVer

:checkVer
%home%\sigcheck.exe -accepteula -nobanner -n "C:\Program Files\VS Revo Group\Revo Uninstaller Pro\RevoUninPro.exe" > temp.txt
set /p currentVer=<temp.txt
del temp.txt
set currentVer=%currentVer:~0,5%
if %currentVer% == %ver% (
   echo RevoUninPro installed newest version !!!
   goto end
)


:install
cd "%desktop%"
curl -o revo.exe https://download.revouninstaller.com/download/RevoUninProSetup.exe -O -L
"%desktop%\revo.exe"


:active
cd "%desktop%"
curl https://github.com/Zenfection/window/releases/download/%tag%/revouninstallerpro4.lic -O -L
sudo move "%desktop%\revouninstallerpro4.lic" "C:\ProgramData\VS Revo Group\Revo Uninstaller Pro"


:delete
cd "%desktop%"
if exist revo.exe powershell rm -r revo.exe

:end
echo Press any key to quit...
pause >nul
if exist "%cur%\revouninstallerpro.bat" powershell rm -r "%cur%\revouninstallerpro.bat"
