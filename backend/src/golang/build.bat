@echo off
cd %~dp0/handlers
set GOOS=linux
set GOARCH=arm64
set CGO_ENABLED=0
for %%i in (*.go) do go get && go build -tags lambda.norpc -o ../../../output/%%~ni/bootstrap %%i
cd ..