@echo off

SET desktop=C:\Users\%username%\Desktop
SET cur=%cd%
SET tag=1.1

goto install
goto active
goto end

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
pause