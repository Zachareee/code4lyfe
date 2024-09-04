package main

import (
	"context"
	"core/entities"
	"core/types"
	"encoding/json"
	"fmt"
	"reflect"
	"strconv"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
)

type MyEvent struct {
	Caregiver string `json:"caregiver"`
}

func HandleRequest(ctx context.Context, event events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	num, err := strconv.ParseInt(event.Body, 10, 32)
	arr, err := entities.DynoDB{}.FetchItems(types.Names.CareDepPair, entities.Searchterm{
		Keyname: "code",
		Key: num,
		Properties: []string{"caregiver", "code"},
		Returntype: reflect.TypeOf(types.CaregiverDependentPairing{}),
	})
	if err != nil {
		fmt.Printf("Got err while fetching items: %+v\n", err)
		return events.APIGatewayProxyResponse{}, err
	}

	json, _ := json.Marshal(arr)

	return events.APIGatewayProxyResponse{
		Body: string(json),
	}, nil
}

func main() {
	lambda.Start(HandleRequest)
}
