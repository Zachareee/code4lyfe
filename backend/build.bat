@echo off
rmdir /S /Q %~dp0output
mkdir %~dp0output
set GOOS=linux
set GOARCH=arm64
set CGO_ENABLED=0
cd src/handlers
for /D %%i in (*) do cd %%i && go get && go build -tags lambda.norpc -o ../../../output/%%i/bootstrap && cd ..
