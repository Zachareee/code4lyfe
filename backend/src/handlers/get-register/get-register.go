package main

import (
	"context"
	"encoding/json"
	"os"

	// "core/entities"
	"crypto/rand"
	"fmt"
	"math/big"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/dynamodb"
	"github.com/aws/aws-sdk-go/service/dynamodb/dynamodbattribute"
)

type CaregiverDependentPairing struct {
	Caregiver string `json:"caregiver"`
	Code      int    `json:"code"`
}

type CodeResponse struct {
	Code int `json:"code"`
}

func HandleRequest(ctx context.Context, request events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	sess := session.Must(session.NewSessionWithOptions(session.Options{
		SharedConfigState: session.SharedConfigEnable,
	}))

	var hostname *string
	var service *dynamodb.DynamoDB
	if localhostname, present := os.LookupEnv("LOCALSTACK_HOSTNAME"); present {
		hostname = &localhostname
	}

	service = dynamodb.New(sess, &aws.Config{Endpoint: hostname})
	code, _ := rand.Int(rand.Reader, big.NewInt(1_000_000))
	userID := "no"
	intcode := int(code.Uint64())
	item := CaregiverDependentPairing{
		Caregiver: userID,
		Code:      intcode,
	}
	// item := CodeResponse{intcode}

	av, err := dynamodbattribute.MarshalMap(item)
	if err != nil {
		fmt.Printf("Got error calling MarshalMap:, %+v", err)
		return events.APIGatewayProxyResponse{}, err
	}

	_, err = service.PutItem(&dynamodb.PutItemInput{
		Item:      av,
		TableName: aws.String("CaregiverCodePair"),
	})

	if err != nil {
		fmt.Printf("Got error calling PutItem: %+v", err)
		return events.APIGatewayProxyResponse{}, err
	}

	fmt.Printf("The code is %d", code)
	js, _ := json.Marshal(CodeResponse{
		Code: intcode,
	})

	return events.APIGatewayProxyResponse{
		StatusCode: 200,
		Headers: map[string]string{
			"userID": userID,
		},
		Body: string(js),
	}, nil
}

func main() {
	lambda.Start(HandleRequest)
}
