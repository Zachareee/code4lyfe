package entities

import (
	"fmt"
	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/session"
	"os"
)

var sess *session.Session

func GetSession() (*session.Session, error) {
	if sess != nil {
		return sess, nil
	}

	var hostname *string
	if localhostname, present := os.LookupEnv("LOCALSTACK_HOSTNAME"); present {
		host := fmt.Sprintf("http://%s:%d", localhostname, 4566)
		hostname = &host
	}

	return session.Must(session.NewSessionWithOptions(session.Options{
		SharedConfigState: session.SharedConfigEnable,
		Config: aws.Config{
			Endpoint: hostname,
		},
	})), nil
}
