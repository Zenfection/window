@echo off

SET desktop=C:\Users\%username%\Desktop


goto install
goto active
goto delete
goto end

:install
cd %desktop%
curl https://download.revouninstaller.com/download/RevoUninProSetup.exe -O -L
.\RevoUninProSetup.exe


:active
cd %desktop%
curl https://github.com/Zenfection/window/files/7353627/revouninstallerpro4.zip -O -L
powershell -Command "Expand-Archive revouninstallerpro4.zip"
powershell rm -r "C:\ProgramData\VS Revo Group\Revo Uninstaller Pro\revouninstallerpro4.lic"
move %desktop%\revouninstallerpro4\revouninstallerpro4.lic "C:\ProgramData\VS Revo Group\Revo Uninstaller Pro\"


:delete
cd %desktop%
if exist RevoUninProSetup.exe powershell rm -r RevoUninProSetup.exe
if exist revouninstallerpro4.zip powershell rm -r revouninstallerpro4.zip
if exist revouninstallerpro4 powershell rm -r revouninstallerpro4

:end
PAUSE
