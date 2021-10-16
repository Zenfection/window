@echo off
setlocal enabledelayedexpansion

SET desktop=C:\Users\%username%\Desktop
SET cur=%cd%
SET ver=2100720099

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
    goto goodls
    goto install
    goto installUpdate
    goto active
    goto end
)

:goodls
if not exist "%desktop%\goodls.exe" (
    curl -o "%desktop%\goodls.exe" "https://github.com/tanaikech/goodls/releases/download/v1.2.7/goodls_windows_amd64.exe" -O -L
)

:install
cd "%desktop%"
powershell %desktop%\goodls.exe -u https://drive.google.com/file/d/1TNu1Sb894j9L6PVhZ9PK8FwkBgGKU8vs/view?usp=sharing -f acrobat.zip
powershell -Command "Expand-Archive acrobat.zip" 
"%desktop%acrobat\acrobat\Adobe Acrobat\Setup.exe"

:installUpdate
cd "%desktop%"
curl -o acrobatUpdate.msp https://ardownload2.adobe.com/pub/adobe/acrobat/win/AcrobatDC/%ver%/AcrobatDCUpd%ver%.msp -O -L
%desktop%\acrobatUpdate.msp 

:active
cd "%desktop%"
curl https://github.com/Zenfection/window/files/7353857/adobe.snr.patch.v2.0-painter.zip -O -L
powershell -Command "Expand-Archive adobe.snr.patch.v2.0-painter.zip"
%desktop%\adobe.snr.patch.v2.0-painter\adobe.snr.patch.v2.0-painter.exe
powershell rm -r adobe.snr.patch.v2.0-painter
powershell rm -r adobe.snr.patch.v2.0-painter.zip


:delete
cd "%desktop%"
if exist acrobat.zip powershell rm -r acrobat.zip
if exist acrobat powershell rm -r acrobat
if exist acrobatUpdate.msp powershell rm -r acrobatUpdate.msp

:end
if exist "%cur%\adobe_acrobat.bat" powershell rm -r "%cur%\adobe_acrobat.bat"
PAUSE
EXIT