package entities

import (
	"reflect"

	"github.com/aws/aws-sdk-go/service/dynamodb"
	"github.com/aws/aws-sdk-go/service/dynamodb/dynamodbattribute"
	"github.com/aws/aws-sdk-go/service/dynamodb/expression"
)

type Searchterm struct {
	Keyname string
	Key any
	Properties []string
	Returntype reflect.Type
}

type DynoDB struct {
	db *dynamodb.DynamoDB
}

func (d *DynoDB) getDB() (*dynamodb.DynamoDB, error) {
	if d.db != nil {
		return d.db, nil
	}

	sess, err := GetSession()
	if err != nil {
		return nil, err
	}

	d.db = dynamodb.New(sess)
	return d.db, nil
}

func (d DynoDB) AddItemToTable(tablename string, item any) error {
	service, err := d.getDB()
	if err != nil {
		return err
	}

	av, err := dynamodbattribute.MarshalMap(item)
	if err != nil {
		return err
	}

	_, err = service.PutItem(&dynamodb.PutItemInput{
		Item:      av,
		TableName: &tablename,
	})

	return err
}

func (d DynoDB) FetchItems(tablename string, search Searchterm) ([]any, error) {
	filter := expression.Name(search.Keyname).Equal(expression.Value(search.Key))
	project := expression.ProjectionBuilder{}
	for _, i := range search.Properties {
		project.AddNames(expression.Name(i))
	}

	exp, _ := expression.NewBuilder().WithFilter(filter).WithProjection(project).Build()

	result, err := d.db.Scan(&dynamodb.ScanInput{
		ExpressionAttributeNames:  exp.Names(),
		ExpressionAttributeValues: exp.Values(),
		FilterExpression:          exp.Filter(),
		ProjectionExpression:      exp.Projection(),
		TableName:                 &tablename,
	})

	if err != nil {
		return nil, err
	}

	array := reflect.New(reflect.SliceOf(search.Returntype)).Interface().([]any)

	for _, i := range result.Items {
		var item any

		dynamodbattribute.UnmarshalMap(i, &item)
		array = append(array, item)
	}

	return array, nil
}
