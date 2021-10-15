@echo off
setlocal enabledelayedexpansion

SET desktop=C:\Users\%username%\Desktop
SET ver=2100720099

wmic datafile where name="C:\\Program Files (x86)\\Adobe\\Acrobat DC\\Acrobat\\Acrobat.exe" get Version /value > ver.txt
type ver.txt | findstr /v "^$" > 123.txt
set /p lastVer=<123.txt
set /p lastVer=<123.txt
set lastVer=%lastVer: =%
set lastVer=%lastVer:.=%
set lastVer=%lastVer:~8%
set temp=%ver:~4,6%
powershell rm ver.txt
powershell rm 123.txt

echo %lastVer% | findstr /C:%temp%>nul && (
        ECHO Now App is installed newest !!
        PAUSE
        EXIT
) || (
    goto installUpdate
)

if not exist %desktop%\goodls.exe goto goodls

if not exist %desktop%\acrobat.zip goto install

goto active



rem Xoá các file không c?n thi?t
cd %desktop%
if exist acrobat.zip powershell rm -r acrobat.zip
if exist acrobat powershell rm -r acrobat
if exist acrobatUpdate.msp powershell rm -r acrobatUpdate.msp
if exist Adobe_Acrobat powershell rm -r Adobe_Acrobat

goto end

:goodls
wget "https://github.com/tanaikech/goodls/releases/download/v1.2.7/goodls_windows_amd64.exe" -O %desktop%\goodls.exe

:install
cd %desktop%
powershell %desktop%\goodls.exe -u https://drive.google.com/file/d/1iQGThgTnCyKmRUIXsLm2ZPFEYNEMkLlC/view?usp=sharing -f acrobat.zip
powershell -Command "Expand-Archive acrobat.zip -DestinationPath acrobat"
start \acrobat\Adobe_Acrobat_Pro_DC\Acrobat_DC_Web_WWMUI.exe   
"\Adobe Acrobat\Adobe Acrobat\Setup.exe"

:installUpdate
cd %desktop%
wget https://ardownload2.adobe.com/pub/adobe/acrobat/win/AcrobatDC/%ver%/AcrobatDCUpd%ver%.msp -O acrobatUpdate.msp
.\acrobatUpdate.msp 

:active
cd "%desktop%\acrobat\Adobe_Acrobat_Pro_DC\Activation"
powershell -Command "Expand-Archive adobe.snr.patch.v2.0-painter.zip"
adobe.snr.patch.v2.0-painter\adobe.snr.patch.v2.0-painter.exe

:end
PAUSE