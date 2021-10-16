@echo off
title Basic Tool Zen

set cur=%cd%
set tag=1.1
set home=C:\ToolZen
where choco > temp.txt
set /p choco=<temp.txt


echo %choco% | findstr /C:choco.exe>nul && (
   echo chocolatey is installed !!!
) || (
   goto chocolatey
)

if not exist %home% mkdir %home%

goto basic
goto sigcheck
goto goodls
goto delete
goto end

:chocolatey
powershell Get-ExecutionPolicy
powershell Set-ExecutionPolicy AllSigned
powershell Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco feature enable -n allowGlobalConfirmation

:basic
powershell choco install wget gsudo chocolateygui


:sigcheck
if not exist %home%\sigcheck.exe (
   curl -o %home%\sigcheck.exe https://github.com/Zenfection/window/releases/download/%tag%/sigcheck.exe -O -L
)

:goodls
if not exist %home%\goodls.exe (
   curl -o %home%\goodls.exe https://github.com/Zenfection/window/releases/download/%tag%/goodls.exe -O -L
)

:delete
del %cd%\temp.txt
del %cd%\check.bat

:end
PAUSE
