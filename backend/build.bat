@echo off
cd %~dp0
rmdir /S /Q output
mkdir output
cd src
for /D %%i in (*) do cd %%i && build && cd ..