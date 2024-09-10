@echo off
cd %~dp0/handlers
set GOOS=linux
set GOARCH=arm64
set CGO_ENABLED=0
go get
for %%i in (*.go) do go build -tags lambda.norpc -o ../../../output/%%~ni/bootstrap %%i