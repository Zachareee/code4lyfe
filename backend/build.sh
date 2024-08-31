mkdir output
set GOOS=linux
set GOARCH=amd64
set CGO_ENABLED=0
for i in src/handlers/*; do
(
    cd $i
    folder=${i#src/handlers}
    go build -tags lambda.norpc -o ../../../output/$folder/bootstrap
)&
done
wait