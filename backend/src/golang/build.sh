GOOS=linux
GOARCH=arm64
CGO_ENABLED=0
cd handlers
go get
for i in *.go; do
    go build -tags lambda.norpc -o ../../../output/${i%%\.go}/bootstrap $i
done