@echo off

title Install EVkey
SET tag=1.1
SET desktop=C:\Users\%username%\Desktop
SET cur=%cd%

goto exist
goto install
goto sucess
goto delete
goto end

:exist
if exist C:\EVKey\EVKey64.exe (
    echo EVKey installed !!!
    goto end
)

:install
cd "%desktop%"
curl https://github.com/Zenfection/window/releases/download/%tag%/EVKey.zip -O -L
if not exist C:\EVKey mkdir C:\EVKey
powershell -Command "Expand-Archive EVKey.zip -DestinationPath C:\EVKey"
sudo copy "C:\EVkey\EVkey.lnk" "%desktop%\EVkey.lnk"
sudo move "C:\EVkey\EVkey.lnk"  "C:\ProgramData\Microsoft\Windows\Start Menu\Programs"

:delete
cd "%desktop%"
if exist EVKey.zip powershell rm -r EVKey.zip
if exist EVKey powershell rm -r EVKey


:sucess
if exist "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\EVKey.lnk"(
    echo C�i ??t th�nh c�ng, h�y m? n? tr�n Desktop
) else (
    echo C�i ??t th?t b?i !!!, h�y b�o l?i cho t�i
) 

:end
if exist "%cur%\evkey.bat" del "%cur%\evkey.bat" 
pause