@echo off

SET desktop=C:\Users\%username%\Desktop

if not exist C:\EVKey mkdir C:\EVKey
if exist %desktop%\EVKey.zip ( del %desktop%EVKey.zip )

if exist C:\EVKey\evkau.exe (
    echo EVKey installed !!!
    pause
    exit
)

rem Install EVkey
cd %desktop%
wget "https://github.com/lamquangminh/EVKey/releases/download/Release/EVKey.zip"
powershell -Command "Expand-Archive EVKey.zip -DestinationPath C:\EVKey"
start C:/EVkey/EVKey64.exe

rem Delete all file not necessary
if exist C:\EVKey\EVKey32.exe powershell rm -r C:\EVKey\EVKey32.exe
if C:\EVKey\SHA256.txt powershell rm -r C:\EVKey\SHA256.txt
if %desktop%\EVKey.zip powershell rm -r %desktop%\EVKey.zip
    
PAUSE