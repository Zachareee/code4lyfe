module code/entities

go 1.23

require (
	core/types v0.0.0-00010101000000-000000000000
	github.com/aws/aws-sdk-go v1.55.5
)

require github.com/jmespath/go-jmespath v0.4.0 // indirect

replace core/types => ../types/
