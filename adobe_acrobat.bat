@echo off
setlocal enabledelayedexpansion

SET tag=1.1
SET ver=2100720099
SET cur=%cd%
SET home=C:\ToolZen
SET desktop=C:\Users\%username%\Desktop


wmic datafile where name="C:\\Program Files (x86)\\Adobe\\Acrobat DC\\Acrobat\\Acrobat.exe" get Version /value > ver.txt
type ver.txt | findstr /v "^$" > 123.txt
set /p lastVer=<123.txt
set lastVer=%lastVer: =%
set lastVer=%lastVer:.=%
set lastVer=%lastVer:~8%
set temp=%ver:~4,6%
del ver.txt
del 123.txt

echo %lastVer% | findstr /C:%temp%>nul && (
    echo Now App is installed newest !!
    goto installUpdate
    goto active
    goto delete
    goto end
) || (
    goto install
    goto installUpdate
    goto active
    goto end
)

:install
cd "%desktop%"
curl https://github.com/Zenfection/window/releases/download/%tag%/acrobat.zip -O -L
powershell -Command "Expand-Archive acrobat.zip" 
"%desktop%\acrobat\Setup.exe"

:installUpdate
cd "%desktop%"
curl -o acrobatUpdate.msp https://ardownload2.adobe.com/pub/adobe/acrobat/win/AcrobatDC/%ver%/AcrobatDCUpd%ver%.msp -O -L
"%desktop%\acrobatUpdate.msp"

:active
cd "%desktop%"
curl https://github.com/Zenfection/window/releases/download/%tag%/activeAdobe.exe -O -L
curl https://github.com/Zenfection/window/releases/download/%tag%/fixAcrobat_x64.reg -O -L
"%desltop%\activeAdobe.exe"
"%desktop%\fixAcrobat_x64.reg"
del activeAdobe.exe


:delete
cd "%desktop%"
if exist acrobat.zip powershell rm -r acrobat.zip
if exist acrobat powershell rm -r acrobat
if exist acrobatUpdate.msp powershell rm -r acrobatUpdate.msp

:end
if exist "%cur%\adobe_acrobat.bat" powershell rm -r "%cur%\adobe_acrobat.bat"
PAUSE
EXIT