@echo off

SET desktop=C:\Users\%username%\Desktop

cd %desktop%
wget https://download.revouninstaller.com/download/RevoUninProSetup.exe -O revo.exe
./revo.exe