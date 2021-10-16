@echo off

SET tag=1.1
SET desktop=C:\Users\%username%\Desktop
SET cur=%cd%

goto install
goto active
goto delete
goto end

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
if exist "%cur%\revouninstallerpro.bat" powershell rm -r "%cur%\revouninstallerpro.bat"
pause
