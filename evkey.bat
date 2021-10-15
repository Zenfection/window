@echo off

SET desktop=C:\Users\%username%\Desktop\

if not exist C:\EVKey mkdir C:\EVKey
if not exist %desktop%\EVKey.zip (powershell rm -r %desktop%EVKey.zip)
if not exist C:\EVKey\evkau.exe (
    rem Cài ??t EVkey
    cd %desktop%
    wget "https://github.com/lamquangminh/EVKey/releases/download/Release/EVKey.zip"
    powershell -Command "Expand-Archive EVKey.zip -DestinationPath C:\EVKey"

    rem Xoá nh?ng file không c?n thi?t
    powershell rm -r C:\EVKey\EVKey32.exe
    powershell rm -r C:\EVKey\SHA256.txt
    powershell rm -r %desktop%\EVKey.zip
    
    rem Kh?i ch?y file
    start C:/EVkey/EVKey64.exe
) else (
    echo "EVkey is installed !!!"
)
PAUSE