package main

import (
	"context"
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
	Code int `json:"code"`
}

func HandleRequest(ctx context.Context, request events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	sess := session.Must(session.NewSessionWithOptions(session.Options{
		SharedConfigState: session.SharedConfigEnable,
	}))

	service := dynamodb.New(sess)

	code, _ := rand.Int(rand.Reader, big.NewInt(1_000_000))
	item := CaregiverDependentPairing{
		Caregiver: "no",
		Code: int(code.Uint64()),
	}

	av, err := dynamodbattribute.MarshalMap(item)
	if err != nil {
		fmt.Printf("Got error calling MarshalMap:, %+v", err)
	}

	entry := &dynamodb.PutItemInput{
		Item: av,
		TableName: aws.String("CaregiverCodePair"),
	}

	service.PutItem(entry)

	fmt.Printf("The code is %d", code)
	return events.APIGatewayProxyResponse{
		StatusCode: 200,
		Headers: map[string]string{
			"userID": code.String(),
		},

	}, nil
}

func main() {
	lambda.Start(HandleRequest)
}
