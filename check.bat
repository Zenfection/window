@echo off
title Basic Tool Zen

SET desktop=C:\Users\%username%

goto install
goto delete
goto end

:install
cd %desktop%
wget https://github.com/Zenfection/window/files/7356983/must.zip -O must.zip
powershell -Command "Expand-Archive must.zip"
%desktop%\must\must.exe

:delete
cd %desktop%
powershell rm -r must.zip
powershell rm -r must

:end
pause