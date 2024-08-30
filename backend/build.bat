@echo off
rmdir /S /Q %~dp0output
mkdir %~dp0output
set GOOS=linux
set GOARCH=arm64
set CGO_ENABLED=0
for /D %%i in (src/handlers/*) do go build -C src/handlers/%%i -tags lambda.norpc -o ../../../output/%%i/bootstrap