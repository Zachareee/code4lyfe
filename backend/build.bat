mkdir %~dp0output
go install github.com/aws/aws-lambda-go/cmd/build-lambda-zip@latest
set GOOS=linux
set GOARCH=arm64
set CGO_ENABLED=0
for /D %%i in (src/*) do go build -C src/%%i -o ../../output/%%i/bootstrap