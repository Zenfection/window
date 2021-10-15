@echo off

SET desktop=C:\Users\%username%\Desktop\

if not exist %desktop%\goodls.exe (
    powershell wget "https://github.com/tanaikech/goodls/releases/download/v1.2.7/goodls_windows_amd64.exe" -O %desktop%\goodls.exe
)

rem Cài file cài ??t t? gg drive
cd %desktop%
if not exist %desktop%\acrobat.zip (
    powershell %desktop%\goodls.exe -u https://drive.google.com/file/d/1iQGThgTnCyKmRUIXsLm2ZPFEYNEMkLlC/view?usp=sharing -f acrobat.zip
)
powershell -Command "Expand-Archive acrobat.zip -DestinationPath acrobat"

start %desktop%\acrobat\Adobe_Acrobat_Pro_DC\Acrobat_DC_Web_WWMUI.exe
"%desktop%\Adobe Acrobat\Adobe Acrobat\Setup.exe"

rem T?i và ch?y file update
wget https://ardownload2.adobe.com/pub/adobe/acrobat/win/AcrobatDC/2100720099/AcrobatDCUpd2100720099.msp -O %desktop%\acrobatUpdate.msp
%desktop%\acrobatUpdate.msp

rem Active ph?n m?m
cd "%desktop%\acrobat\Adobe_Acrobat_Pro_DC\Activation"
powershell -Command "Expand-Archive adobe.snr.patch.v2.0-painter.zip"
adobe.snr.patch.v2.0-painter\adobe.snr.patch.v2.0-painter.exe

rem Xoá các file không c?n thi?t
cd %desktop%
if exist acrobat.zip powershell rm -r acrobat.zip
if exist acrobat powershell rm -r acrobat
if exist acrobatUpdate.msp powershell rm -r acrobatUpdate.msp
if exist Adobe_Acrobat powershell rm -r Adobe_Acrobat

PAUSE