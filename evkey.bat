@echo off

SET desktop=C:\Users\%username%\Desktop

goto exist
goto install
goto delete

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
C:/EVkey/EVKey64.exe

:delete
cd %desktop%
if exist EVKey.zip powershell rm -r EVKey.zip
if exist EVKey powershell rm -r EVKey

:end
pause