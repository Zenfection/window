@echo off

SET ver=12.5.0
SET cur=%cd%
SET tag=2.0
SET home=C:\ToolZen
SET desktop=C:\Users\%username%\Desktop

goto check
goto install
goto active
goto delete
goto end


:check
if exist "C:\Program Files\MiniTool Partition Wizard 12\partitionwizard.exe" goto checkVer

:checkVer
%home%\sigcheck.exe -accepteula -nobanner -n  "C:\Program Files\MiniTool Partition Wizard 12\partitionwizard.exe" > temp.txt
set /p currentVer=<temp.txt
del temp.txt
rem --can change version--
set currentVer=%currentVer:~0,6% 
if %currentVer% == %ver% (
   echo Movavi Video Convert Premium installed newest version !!!
   goto end
)


:install
cd "%desktop%"
curl https://github.com/Zenfection/window/releases/download/%tag%/minitool.zip -O -L
powershell -Command "Expand-Archive minitool.zip" 
"%desktop%\minitool\Setup.exe"


:active
sudo move "%desktop%\minitool\active\partitionwizard.dll" "C:\Program Files\MiniTool Partition Wizard 12\"
sudo move "%desktop%\minitool\active\partitionwizard.exe" "C:\Program Files\MiniTool Partition Wizard 12\"
sudo move "%desktop%\minitool\active\partitionwizard.exe.mfh" "C:\Program Files\MiniTool Partition Wizard 12\"

:delete
cd "%desktop%"
powershell rm -r minitool.zip 
powershell rm -r minitool
if exist "%cur%\minitool.bat" del "%cur%\minitool.bat"

:end
echo Press any key to quit...
pause >nul
exit