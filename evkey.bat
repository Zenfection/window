@echo off

SET desktop=C:\Users\%username%\Desktop
SET cur=%cd%

goto exist
goto install
goto delete
goto run
goto end

:exist
if exist C:\EVKey\EVKey64.exe (
    echo EVKey installed !!!
    goto end
)


:install
cd %desktop%
wget --no-check-certificate https://github.com/Zenfection/window/files/7357023/EVKey.zip -O EVKey.zip
if not exist C:\EVKey mkdir C:\EVKey
powershell -Command "Expand-Archive EVKey.zip -DestinationPath C:\EVKey"

:delete
cd %desktop%
if exist EVKey.zip powershell rm -r EVKey.zip
if exist EVKey powershell rm -r EVKey

:run 
C:/EVkey/EVKey64.exe

:end
if exist %cur%\evkey.bat del %cur%\evkey.bat
pause
exit