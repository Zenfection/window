@echo off
setlocal enabledelayedexpansion

SET tag=1.1
SET ver=21.7.20099
SET cur=%cd%
SET home=C:\ToolZen
SET desktop=C:\Users\%username%\Desktop


if not exist "C:\Program Files (x86)\Adobe\Acrobat DC\Acrobat\Acrobat.exe" (
    goto install
    goto installUpdate
    goto active
    goto delete
    goto end
) else (
    goto checkVer
)


:checkVer
%home%\sigcheck.exe -accepteula -nobanner -n "C:\Program Files (x86)\Adobe\Acrobat DC\Acrobat\Acrobat.exe" > temp.txt
set /p currentVer=<temp.txt
del temp.txt
set currentVer=%currentVer:~0,10%
if %currentVer% == %ver% (
    echo Adobe Acrobat DC Pro installed newest version !!!
    goto end
) else (
    goto installUpdate
    goto active
    goto delete
    goto end
)



:install
cd "%desktop%"
curl https://github.com/Zenfection/window/releases/download/%tag%/acrobat.zip -O -L
powershell -Command "Expand-Archive acrobat.zip" 
"%desktop%\acrobat\Setup.exe"

:installUpdate
cd "%desktop%"
curl -o acrobatUpdate.msp https://ardownload2.adobe.com/pub/adobe/acrobat/win/AcrobatDC/2100720099/AcrobatDCUpd2100720099.msp -O -L
start acrobatUpdate.msp

:active
cd "%desktop%"
curl https://github.com/Zenfection/window/releases/download/%tag%/activeAdobe.exe -O -L
curl https://github.com/Zenfection/window/releases/download/%tag%/fixAcrobat_x64.reg -O -L
start activeAdobe.exe
start fixAcrobat_x64.reg
del activeAdobe.exe
del fixAcrobat_x64.reg


:delete
cd "%desktop%"
if exist acrobat.zip powershell rm -r acrobat.zip
if exist acrobat powershell rm -r acrobat
if exist acrobatUpdate.msp del acrobatUpdate.msp

:end
echo Press any key to quit...
pause >nul
if exist "%cur%\adobe_acrobat.bat" del "%cur%\adobe_acrobat.bat"
EXIT