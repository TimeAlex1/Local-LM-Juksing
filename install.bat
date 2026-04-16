@echo off

echo Installing Python
start /wait python-installer.msix
echo Python succesfully installed

echo Installing AutoHotkey v1.1
start /wait ahk-installer.exe
echo AutoHotkey succesfully installed

echo Installing LM Studio
start /wait lmstudio-installer.exe
echo LM Studio installed

lms get google/gemma-3-4b

echo Gemma-3-4b installed
copy "./LM Shortcut.ahk" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
echo Copied shortcut to startup directory

pip install lmstudio
pip install pyperclip
pip install pyautogui

copy "./LM_script.py" "%USERPROFILE%\Documents"
echo Copied script to documents directory

start "%localappdata%\Programs\AutoHotkey\v2\AutoHotkey64.exe" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\LM Shortcut.ahk"
echo Started AHK Script

pause