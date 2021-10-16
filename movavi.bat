@echo off
title Install Movavi Video Convert Premium

SET tag=1.1
SET ver=22.0
SET cur=%cd%
SET home=C:\ToolZen
SET desktop=C:\Users\%username%\Desktop

goto check
goto install
goto delete
goto active
goto end


:check
if exist "C:\Users\zen\AppData\Roaming\Movavi Video Converter 22 Premium\converter.exe" goto checkVer

:checkVer
%home%\sigcheck.exe -accepteula -nobanner -n "C:\Users\%username%\AppData\Roaming\Movavi Video Converter 22 Premium\converter.exe" > temp.txt
set /p currentVer=<temp.txt
del temp.txt
rem --can change version--
set currentVer=%currentVer:~0,4% 
if %currentVer% == %ver% (
   echo Movavi Video Convert Premium installed newest version !!!
   goto end
)

:install
cd "%desktop%"

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

:end 
echo Press any key to quit...
pause >nul
if exist "%cur%\movavi.bat" powershell rm -r "%cur%\movavi.bat"
