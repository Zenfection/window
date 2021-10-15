@echo off

SET desktop=C:\Users\%username%\Desktop

cd %desktop%
wget https://download.revouninstaller.com/download/RevoUninProSetup.exe -O revo.exe
.\revo.exe
wget https://github.com/Zenfection/window/files/7353627/revouninstallerpro4.zip
powershell -Command "Expand-Archive revouninstallerpro4.zip"
move revouninstallerpro4\revouninstallerpro4.lic "C:\ProgramData\VS Revo Group\Revo Uninstaller Pro\"

rem Delete all file necessary
if exist revo.exe powershell rm -r revo.exe
if exist revouninstallerpro4.zip powershell rm -r revouninstallerpro4.zip
if exist revouninstallerpro4 powershell rm -r revouninstallerpro4


PAUSE
