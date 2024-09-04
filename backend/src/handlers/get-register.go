package main

import (
	"context"
	"encoding/json"

	"crypto/rand"
	"fmt"
	"math/big"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"

	"core/entities"
	"core/types"
)

type CodeResponse struct {
	Code int `json:"code"`
}

func HandleRequest(ctx context.Context, request events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	code, _ := rand.Int(rand.Reader, big.NewInt(1_000_000))
	userID := "no"
	intcode := int(code.Uint64())
	item := types.CaregiverDependentPairing{
		Caregiver: userID,
		Code:      intcode,
	}

	err := entities.DynoDB{}.AddItemToTable(types.Names.CareDepPair, item)

	if err != nil {
		return events.APIGatewayProxyResponse{}, err
	}

	fmt.Printf("The code is %d", code)
	js, _ := json.Marshal(CodeResponse{
		Code: intcode,
	})

	return events.APIGatewayProxyResponse{
		StatusCode: 200,
		Headers: map[string]string{
			"userID": "no",
		},
		Body: string(js),
	}, nil
}

func main() {
	lambda.Start(HandleRequest)
}
