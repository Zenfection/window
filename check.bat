@echo off
title Basic Tool Zen

SET desktop=C:\Users\%username%
SET cur=%cd%

goto install
goto delete
goto end

:install
cd "%desktop%"
curl https://github.com/Zenfection/window/files/7357070/must.zip -O -L
powershell -Command "Expand-Archive must.zip"
"%desktop%\must\must.exe"

:delete
cd "%desktop%"
powershell rm -r must.zip
powershell rm -r must
if exist "%cur%\check.bat" powershell rm -r "%cur%\check.bat"

:end
pause
exit