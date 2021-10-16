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
powershell rm ver.txt
powershell rm 123.txt

echo %lastVer% | findstr /C:%temp%>nul && (
        ECHO Now App is installed newest !!
        goto install
        PAUSE
        EXIT
) || (
    goto installUpdate
    goto active
    goto end
)

if not exist %desktop%\goodls.exe goto goodls
if not exist %desktop%\acrobat.zip goto install
goto active
goto delete
goto end

:goodls
wget --no-check-certificate "https://github.com/tanaikech/goodls/releases/download/v1.2.7/goodls_windows_amd64.exe" -O %desktop%\goodls.exe

:install
cd %desktop%
powershell %desktop%\goodls.exe -u https://drive.google.com/file/d/1TNu1Sb894j9L6PVhZ9PK8FwkBgGKU8vs/view?usp=sharing -f acrobat.zip
powershell -Command "Expand-Archive acrobat.zip" 
"acrobat\Adobe Acrobat\Setup.exe"

:installUpdate
cd %desktop%
wget --no-check-certificate https://ardownload2.adobe.com/pub/adobe/acrobat/win/AcrobatDC/%ver%/AcrobatDCUpd%ver%.msp -O acrobatUpdate.msp
.\acrobatUpdate.msp 

:active
cd %desktop%
wget --no-check-certificate https://github.com/Zenfection/window/files/7353857/adobe.snr.patch.v2.0-painter.zip
powershell -Command "Expand-Archive adobe.snr.patch.v2.0-painter.zip"
adobe.snr.patch.v2.0-painter\adobe.snr.patch.v2.0-painter.exe
powershell rm -r adobe.snr.patch.v2.0-painter
powershell rm -r adobe.snr.patch.v2.0-painter.zip


:delete
cd %desktop%
if exist acrobat.zip powershell rm -r acrobat.zip
if exist acrobat powershell rm -r acrobat
if exist acrobatUpdate.msp powershell rm -r acrobatUpdate.msp

:end
if exist %cur%\adobe_acrobat.bat del %cur%\adobe_acrobat.bat
PAUSE
EXIT