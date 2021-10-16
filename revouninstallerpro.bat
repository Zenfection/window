@echo off

SET desktop=C:\Users\%username%\Desktop
SET cur=%cd%

goto install
goto active
goto delete
goto end

:install
cd "%desktop%"
wget https://download.revouninstaller.com/download/RevoUninProSetup.exe -O revo.exe
"%desktop%\revo.exe"


:active
cd "%desktop%"
wget https://github.com/Zenfection/window/files/7353627/revouninstallerpro4.zip -O revouninstallerpro4.zip
powershell -Command "Expand-Archive revouninstallerpro4.zip"
sudo del /S /Q "C:\ProgramData\VS Revo Group\Revo Uninstaller Pro\revouninstallerpro4.lic"
sudo move "%desktop%\revouninstallerpro4\revouninstallerpro4.lic" "C:\ProgramData\VS Revo Group\Revo Uninstaller Pro\"


:delete
cd "%desktop%"
if exist RevoUninProSetup.exe powershell rm -r RevoUninProSetup.exe
if exist revouninstallerpro4.zip powershell rm -r revouninstallerpro4.zip
if exist revouninstallerpro4 powershell rm -r revouninstallerpro4
if exist "%cur%\revouninstallerpro.bat" del "%cur%\revouninstallerpro.bat"

:end
pause
