mkdir output
set GOOS=linux
set GOARCH=amd64
set CGO_ENABLED=0
for i in src/*; do
(
    cd $i
    folder=${i#src/}
    go build -o ../../output/$folder/bootstrap
    cd ../../output/$folder
    zip ../$folder.zip bootstrap
)&
done