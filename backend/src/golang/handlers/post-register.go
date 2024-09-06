package main

import (
	"context"
	"core/entities"
	"core/types"
	"encoding/json"
	"fmt"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
)

func HandleRequest(ctx context.Context, event events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	request := map[string]any{}
	err := json.Unmarshal([]byte(event.Body), &request)
	if err != nil {
		fmt.Println(err)
		return events.APIGatewayProxyResponse{}, nil
	}

	arr, err := entities.DynoDB{}.FetchItems(types.Names.CareCodePair, entities.Searchterm{
		Keyname:    "code",
		Key:        int(request["code"].(float64)),
		Properties: []string{"caregiver", "code"},
	})

	if err != nil {
		fmt.Printf("Got err while fetching items: %+v\n", err)
		return events.APIGatewayProxyResponse{}, err
	}

	if len(arr) != 1 {
		return events.APIGatewayProxyResponse{StatusCode: 404, Body: "Not found"}, nil
	}

	caregiver := arr[0].(map[string]any)["caregiver"]

	err = entities.DynoDB{}.AddItemToTable(types.Names.CareDepPair, types.CaregiverDependentPairing{
		Dependent: int(request["dependent"].(float64)),
		Caregiver: caregiver.(string),
	})

	if err != nil {
		fmt.Println(err)
		return events.APIGatewayProxyResponse{}, err
	}

	return events.APIGatewayProxyResponse{
		Body: "Done",
	}, nil
}

func main() {
	lambda.Start(HandleRequest)
}
