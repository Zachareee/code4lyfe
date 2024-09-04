module code/handlers/get-register

go 1.23.0

require (
	core/entities v0.0.0-00010101000000-000000000000
	core/types v0.0.0-00010101000000-000000000000
	github.com/aws/aws-lambda-go v1.47.0
)

require (
	github.com/aws/aws-sdk-go v1.55.5 // indirect
	github.com/jmespath/go-jmespath v0.4.0 // indirect
)

replace core/entities => ../entities/

replace core/types => ../types
