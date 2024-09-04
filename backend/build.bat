@echo off
rmdir /S /Q %~dp0output
mkdir %~dp0output
set GOOS=linux
set GOARCH=arm64
set CGO_ENABLED=0
cd src/handlers
for %%i in (*.go) do go get && go build -tags lambda.norpc -o ../../output/%%~ni/bootstrap %%i
