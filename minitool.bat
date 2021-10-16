@echo off

SET desktop=C:\Users\%username%\Desktop

goto goodls
goto install
goto active
goto end

:goodls
if not exist %desktop%\goodls.exe (
   wget --no-check-certificate "https://github.com/tanaikech/goodls/releases/download/v1.2.7/goodls_windows_amd64.exe" -O %desktop%\goodls.exe
)

:install
cd %desktop%
powershell %desktop%\goodls.exe -u https://drive.google.com/file/d/1wcjGA1N25Nc4nupun4-SrFFCtjtA0r4c/view?usp=sharing -f minitool.zip
powershell -Command "Expand-Archive minitool.zip" 
%desktop%\minitool\Setup.exe


:active
sudo del /S /Q "C:\Program Files\MiniTool Partition Wizard 12\partitionwizard.dll"
sudo del /S /Q "C:\Program Files\MiniTool Partition Wizard 12\partitionwizard.exe"
sudo del /S /Q "C:\Program Files\MiniTool Partition Wizard 12\partitionwizard.exe.mfh"
sudo move %desktop%\minitool\active\partitionwizard.dll "C:\Program Files\MiniTool Partition Wizard 12\"
sudo move %desktop%\minitool\active\partitionwizard.exe "C:\Program Files\MiniTool Partition Wizard 12\"
sudo move %desktop%\minitool\active\partitionwizard.exe.mfh "C:\Program Files\MiniTool Partition Wizard 12\"

:delete
cd %desktop%
powershell rm -r goodls.exe
powershell rm -r minitool.zip 
powershell rm -r minitool

:end
if exist C:\Users\%username%\minitool.bat del C:\Users\%username%\minitool.bat
pause
exit