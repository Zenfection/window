@echo off
title Install Movavi Video Convert Premium 22.0
SET desktop=C:\Users\%username%\Desktop
SET cur=%cd%

goto goodls
goto install
goto delete
goto active
goto end


:goodls
if not exist %desktop%\goodls.exe (
   wget --no-check-certificate "https://github.com/tanaikech/goodls/releases/download/v1.2.7/goodls_windows_amd64.exe" -O %desktop%\goodls.exe
)


:install
cd %desktop%
powershell %desktop%\goodls.exe -u https://drive.google.com/file/d/1sYUYOFSVIKC0OnraxDjJQ_ZuGe9S6fhD/view?usp=sharing -f movavi.zip
powershell -Command "Expand-Archive movavi.zip"
%desktop%\movavi\Setup.exe

:active
sudo del /S /Q "C:\Users\%username%\AppData\Roaming\Movavi Video Converter 22 Premium\bb2018.dll"
sudo del /S /Q "C:\Users\%username%\AppData\Roaming\Movavi Video Converter 22 Premium\wtsapi32.dll"
sudo move %desktop%\movavi\active\bb2018.dll "C:\Users\%username%\AppData\Roaming\Movavi Video Converter 22 Premium"
sudo move %desktop%\movavi\active\wtsapi32.dll "C:\Users\%username%\AppData\Roaming\Movavi Video Converter 22 Premium"


:delete
cd %desktop%
if exist movavi powershell rm -r movavi
if exist movavi.zip powershell rm -r movavi.zip

:end 
if exist %cur%\movavi.bat del %cur%\movavi.bat
pause
exit
