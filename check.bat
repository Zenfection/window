@echo off
title Basic Tool Zen

SET tag=1.1
SET desktop=C:\Users\%username%
SET cur=%cd%

goto install
goto delete
goto end

:install
cd "%desktop%"
curl https://github.com/Zenfection/window/releases/download/%tag%/must.exe -O -L
"%desktop%\must.exe"

:delete
cd "%desktop%"
powershell rm -r must.zip
powershell rm -r must
if exist "%cur%\check.bat" powershell rm -r "%cur%\check.bat"

:end
pause
exit