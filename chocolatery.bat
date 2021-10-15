@echo off

powershell Get-ExecutionPolicy
powershell Set-ExecutionPolicy AllSigned
powershell Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco feature enable -n allowGlobalConfirmation

rem Download các file c?n thi?t
powershell choco install chocolateygui gsudo teamviewer microsoft-edge potplayer winrar winfetch anydesk

rem Download các file h?c web
powershell sudo choco install python openjdk mingw git github-desktop marktext nodejs yarn vscode vscode-insiders wireguard

pause