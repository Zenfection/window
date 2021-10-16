@echo off
title Install Movavi Video Convert Premium 22.0
SET tag=1.1
SET desktop=C:\Users\%username%\Desktop
SET cur=%cd%

goto goodls
goto install
goto delete
goto active
goto end


:goodls
if not exist "%desktop%\goodls.exe" (
   curl -o "%desktop%\goodls.exe" "https://github.com/Zenfection/window/releases/download/%tag%/goodls.exe" -O -L
)

:install
cd "%desktop%"
powershell "%desktop%\goodls.exe" -u https://drive.google.com/file/d/1sYUYOFSVIKC0OnraxDjJQ_ZuGe9S6fhD/view?usp=sharing -f movavi.zip
powershell -Command "Expand-Archive movavi.zip"
"%desktop%\movavi\Setup.exe"

:active
sudo del "C:\Users\%username%\AppData\Roaming\Movavi Video Converter 22 Premium\bb2018.dll"
sudo del "C:\Users\%username%\AppData\Roaming\Movavi Video Converter 22 Premium\wtsapi32.dll"
sudo move "%desktop%\movavi\active\bb2018.dll" "C:\Users\%username%\AppData\Roaming\Movavi Video Converter 22 Premium"
sudo move "%desktop%\movavi\active\wtsapi32.dll" "C:\Users\%username%\AppData\Roaming\Movavi Video Converter 22 Premium"


:delete
cd "%desktop%"
if exist movavi powershell rm -r movavi
if exist movavi.zip powershell rm -r movavi.zip
if exist "%cur%\movavi.bat" powershell rm -r "%cur%\movavi.bat"

:end 
pause
